import torch
import torch.nn as nn
import torch.optim as optim
import random
from AILibrary import NPCAgent

class BossAgent(NPCAgent):
    def __init__(self, state_size, action_size, hidden_size=128, learning_rate=0.001):
        super(BossAgent, self).__init__()
        self.state_size = state_size
        self.action_size = action_size
        
        # Define a neural network for decision-making
        self.policy_network = nn.Sequential(
            nn.Linear(state_size, hidden_size),
            nn.ReLU(),
            nn.Linear(hidden_size, hidden_size),
            nn.ReLU(),
            nn.Linear(hidden_size, action_size),
            nn.Softmax(dim=-1)
        )
        
        # Optimizer for training
        self.optimizer = optim.Adam(self.policy_network.parameters(), lr=learning_rate)
        
        # Loss function for reinforcement learning
        self.loss_function = nn.CrossEntropyLoss()
        
        # Replay buffer for storing experiences
        self.replay_buffer = []
        self.gamma = 0.99  # Discount factor for future rewards
    
    def act(self, state):
        state_tensor = torch.tensor(state, dtype=torch.float32).unsqueeze(0)
        action_probs = self.policy_network(state_tensor)
        action = torch.multinomial(action_probs, 1).item()
        return action
    
    def remember(self, state, action, reward, next_state, done):
        self.replay_buffer.append((state, action, reward, next_state, done))
    
    def learn(self, batch_size=32):
        if len(self.replay_buffer) < batch_size:
            return  # Not enough samples to learn
        
        # Sample a batch of experiences
        batch = random.sample(self.replay_buffer, batch_size)
        states, actions, rewards, next_states, dones = zip(*batch)
        
        # Convert to tensors
        states = torch.tensor(states, dtype=torch.float32)
        actions = torch.tensor(actions, dtype=torch.int64)
        rewards = torch.tensor(rewards, dtype=torch.float32)
        next_states = torch.tensor(next_states, dtype=torch.float32)
        dones = torch.tensor(dones, dtype=torch.float32)
        
        # Compute target values
        with torch.no_grad():
            next_action_values = self.policy_network(next_states).max(dim=1)[0]
            targets = rewards + self.gamma * next_action_values * (1 - dones)
        
        # Predicted values
        predicted_values = self.policy_network(states).gather(1, actions.unsqueeze(1)).squeeze(1)
        
        # Compute loss
        loss = nn.functional.mse_loss(predicted_values, targets)
        
        # Update the policy network
        self.optimizer.zero_grad()
        loss.backward()
        self.optimizer.step()
    
    def save_model(self, filepath):
        torch.save(self.policy_network.state_dict(), filepath)
    
    def load_model(self, filepath):
        self.policy_network.load_state_dict(torch.load(filepath))
        self.policy_network.eval()



class BossNPC:
    def __init__(self, state_size, action_size, boss_name="Unknown Boss", health=100, attack_power=20, hidden_size=128, learning_rate=0.001):
        self.boss_name = boss_name
        self.health = health
        self.max_health = health
        self.attack_power = attack_power

        self.agent = BossAgent(state_size, action_size, hidden_size, learning_rate)

    def take_damage(self, damage):
        self.health -= damage
        print(f"{self.boss_name} takes {damage} damage! Remaining health: {self.health}")
        if self.health <= 0:
            print(f"{self.boss_name} is defeated!")

    def attack(self):
        damage = random.randint(self.attack_power // 2, self.attack_power)
        print(f"{self.boss_name} attacks and deals {damage} damage!")
        return damage

    def act(self, state):
        action = self.agent.act(state)
        print(f"{self.boss_name} chooses action: {action}")
        return action

    def heal(self, amount):
        self.health = min(self.health + amount, self.max_health)
        print(f"{self.boss_name} heals for {amount}! Current health: {self.health}")

    def special_ability(self):
        print(f"{self.boss_name} unleashes a devastating special ability!")

    def remember_and_learn(self, state, action, reward, next_state, done, batch_size=32):
        self.agent.remember(state, action, reward, next_state, done)
        self.agent.learn(batch_size)

    def save_model(self, filepath):
        self.agent.save_model(filepath)

    def load_model(self, filepath):
        self.agent.load_model(filepath)
