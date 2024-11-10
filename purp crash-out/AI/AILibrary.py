import torch
import torch.nn as nn
import torch.optim as optim
import random
from collections import deque
import numpy as np

# %%
STATES = ['still', 'wander', 'attack', 'interact']
NUM_ACTIONS = len(STATES)

# Define the neural network model
class NPCAIModel(nn.Module):
    def __init__(self, input_dim, hidden_dim):
        super(NPCAIModel, self).__init__()
        self.fc1 = nn.Linear(input_dim, hidden_dim)
        self.fc2 = nn.Linear(hidden_dim, hidden_dim)
        self.fc3 = nn.Linear(hidden_dim, NUM_ACTIONS)

    def forward(self, x):
        x = torch.relu(self.fc1(x))
        x = torch.relu(self.fc2(x))
        return self.fc3(x)

# Reinforcement learning agent
class NPCAgent:
    def __init__(self, state_dim, hidden_dim=64, lr=0.001, gamma=0.99, epsilon=1.0, epsilon_decay=0.995, epsilon_min=0.1):
        self.model = NPCAIModel(state_dim, hidden_dim)
        self.target_model = NPCAIModel(state_dim, hidden_dim)
        self.optimizer = optim.Adam(self.model.parameters(), lr=lr)
        self.loss_fn = nn.MSELoss()
        self.replay_buffer = deque(maxlen=10000)
        self.gamma = gamma
        self.epsilon = epsilon
        self.epsilon_decay = epsilon_decay
        self.epsilon_min = epsilon_min
        self.batch_size = 32

        # Synchronize the target model with the main model
        self.update_target_model()

    def update_target_model(self):
        self.target_model.load_state_dict(self.model.state_dict())

    def select_action(self, state, player_position, npc_position, vision_range=5):
        """Select an action based on epsilon-greedy policy and the player's presence."""
        if self.can_see_player(player_position, npc_position, vision_range):
            return STATES.index('attack')
        else:
            if random.random() < self.epsilon:
                return random.choice(range(NUM_ACTIONS)) 
            else:
                with torch.no_grad():
                    q_values = self.model(torch.tensor(state, dtype=torch.float32))
                    return torch.argmax(q_values).item()

    def can_see_player(self, player_position, npc_position, vision_range):
        """Check if the player is within the vision range of the NPC."""
        distance = np.linalg.norm(np.array(player_position) - np.array(npc_position))
        return distance <= vision_range

    def store_experience(self, state, action, reward, next_state, done):
        """Store an experience in the replay buffer."""
        self.replay_buffer.append((state, action, reward, next_state, done))

    def train(self):
        """Train the model using experience replay."""
        if len(self.replay_buffer) < self.batch_size:
            return  # Not enough experiences to train

        # Sample a batch of experiences
        batch = random.sample(self.replay_buffer, self.batch_size)
        states, actions, rewards, next_states, dones = zip(*batch)

        states = torch.tensor(states, dtype=torch.float32)
        actions = torch.tensor(actions, dtype=torch.long)
        rewards = torch.tensor(rewards, dtype=torch.float32)
        next_states = torch.tensor(next_states, dtype=torch.float32)
        dones = torch.tensor(dones, dtype=torch.float32)

        q_values = self.model(states).gather(1, actions.unsqueeze(1)).squeeze(1)
        with torch.no_grad():
            max_next_q_values = self.target_model(next_states).max(1)[0]
            target_q_values = rewards + self.gamma * max_next_q_values * (1 - dones)

        loss = self.loss_fn(q_values, target_q_values)
        self.optimizer.zero_grad()
        loss.backward()
        self.optimizer.step()
        self.epsilon = max(self.epsilon_min, self.epsilon * self.epsilon_decay)

# %%
ACTIONS = ['up', 'down', 'left', 'right']
NUM_ACTIONS = len(ACTIONS)

class MapLearningModel(nn.Module):
    def __init__(self, input_dim, hidden_dim):
        super(MapLearningModel, self).__init__()
        self.fc1 = nn.Linear(input_dim, hidden_dim)
        self.fc2 = nn.Linear(hidden_dim, hidden_dim)
        self.fc3 = nn.Linear(hidden_dim, NUM_ACTIONS)  

    def forward(self, x):
        x = torch.relu(self.fc1(x))
        x = torch.relu(self.fc2(x))
        return self.fc3(x)

class WanderingAgent:
    def __init__(self, grid_size, input_dim, hidden_dim=64, lr=0.001, gamma=0.99, epsilon=1.0, epsilon_decay=0.995, epsilon_min=0.1):
        self.grid_size = grid_size
        self.model = MapLearningModel(input_dim, hidden_dim)
        self.target_model = MapLearningModel(input_dim, hidden_dim)
        self.optimizer = optim.Adam(self.model.parameters(), lr=lr)
        self.loss_fn = nn.MSELoss()
        self.replay_buffer = deque(maxlen=10000)
        self.gamma = gamma
        self.epsilon = epsilon
        self.epsilon_decay = epsilon_decay
        self.epsilon_min = epsilon_min
        self.batch_size = 32

        self.discovered_map = np.zeros(grid_size, dtype=int)
        self.update_target_model()

    def update_target_model(self):
        self.target_model.load_state_dict(self.model.state_dict())

    def select_action(self, state):
        """Select an action based on epsilon-greedy policy."""
        if random.random() < self.epsilon:
            return random.choice(range(NUM_ACTIONS))
        else:
            with torch.no_grad():
                q_values = self.model(torch.tensor(state, dtype=torch.float32))
                return torch.argmax(q_values).item()

    def store_experience(self, state, action, reward, next_state, done):
        """Store an experience in the replay buffer."""
        self.replay_buffer.append((state, action, reward, next_state, done))

    def train(self):
        """Train the model using experience replay."""
        if len(self.replay_buffer) < self.batch_size:
            return

        batch = random.sample(self.replay_buffer, self.batch_size)
        states, actions, rewards, next_states, dones = zip(*batch)

        states = torch.tensor(states, dtype=torch.float32)
        actions = torch.tensor(actions, dtype=torch.long)
        rewards = torch.tensor(rewards, dtype=torch.float32)
        next_states = torch.tensor(next_states, dtype=torch.float32)
        dones = torch.tensor(dones, dtype=torch.float32)

        q_values = self.model(states).gather(1, actions.unsqueeze(1)).squeeze(1)

        with torch.no_grad():
            max_next_q_values = self.target_model(next_states).max(1)[0]
            target_q_values = rewards + self.gamma * max_next_q_values * (1 - dones)

        loss = self.loss_fn(q_values, target_q_values)
        self.optimizer.zero_grad()
        loss.backward()
        self.optimizer.step()

        self.epsilon = max(self.epsilon_min, self.epsilon * self.epsilon_decay)

    def update_map(self, position, grid):
        """Update the discovered map with current grid information."""
        self.discovered_map = grid.copy()

    def get_state_representation(self, grid, position):
        """Create a state representation for the current map and position."""
        flat_map = grid.flatten() 
        current_position_encoded = np.zeros(self.grid_size[0] * self.grid_size[1])
        current_position_encoded[position[0] * self.grid_size[1] + position[1]] = 1
        return np.concatenate((flat_map, current_position_encoded))
    

# %%
def display_path(grid, path):
    """Display the grid with the path taken by the NPC."""
    path_grid = grid.astype(object)
    for pos in path:
        if path_grid[pos] == 0:  # Only mark the path on open cells
            path_grid[pos] = '$'
    path_grid[path[0]] = 'S'  # Mark starting position
    path_grid[path[-1]] = 'E'  # Mark ending position

    # Print the grid with the path
    print("\nPath taken by the NPC:")
    for row in path_grid:
        print(" ".join(str(cell) for cell in row))

# Example usage after an episode
grid_size = (10, 10)  # Example grid size
input_dim = grid_size[0] * grid_size[1] * 2  # Map + position encoding
agent = WanderingAgent(grid_size, input_dim)

# Create a sample grid: 0 = open, 1 = NPC, 2 = user, 3 = building
sample_grid = np.array([
    [0, 0, 3, 0, 0, 0, 3, 0, 0, 0],
    [0, 1, 0, 0, 0, 2, 0, 0, 3, 0],
    [0, 0, 3, 0, 0, 0, 0, 3, 0, 0],
    [0, 3, 0, 0, 1, 0, 0, 0, 0, 3],
    [0, 0, 0, 3, 0, 0, 0, 0, 1, 0],
    [3, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 3, 0, 0, 0, 0, 3, 0, 0, 0],
    [0, 0, 1, 0, 3, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 3, 0, 0, 0, 1],
    [0, 0, 0, 3, 0, 0, 0, 0, 0, 0]
])

npc_position = [0, 0]  # Starting position of the NPC
agent.update_map(npc_position, sample_grid)

for episode in range(3):  # Number of episodes (reduced for brevity)
    path = []  # Track the path for each episode
    state = agent.get_state_representation(sample_grid, npc_position)
    done = False

    while not done:
        path.append(tuple(npc_position))  # Record current position in the path

        action_index = agent.select_action(state)
        action = ACTIONS[action_index]

        # Determine new position based on action
        new_position = npc_position[:]
        if action == 'up' and npc_position[0] > 0:
            new_position[0] -= 1
        elif action == 'down' and npc_position[0] < grid_size[0] - 1:
            new_position[0] += 1
        elif action == 'left' and npc_position[1] > 0:
            new_position[1] -= 1
        elif action == 'right' and npc_position[1] < grid_size[1] - 1:
            new_position[1] += 1

        # Check if the move is valid and update the position
        if sample_grid[new_position[0], new_position[1]] in [0, 2]:  # Can only move to open or user-occupied cells
            npc_position = new_position
            reward = 1 if sample_grid[new_position[0], new_position[1]] == 2 else 0.1  # Reward for finding user
        else:
            reward = -0.5  # Penalty for hitting obstacles (NPCs or buildings)

        # Create the next state
        next_state = agent.get_state_representation(sample_grid, npc_position)
        done = random.random() < 0.05  # Simulate episode ending condition

        agent.store_experience(state, action_index, reward, next_state, done)
        agent.train()

        state = next_state  # Transition to the next state

    # Display the path after the episode
    display_path(sample_grid, path)

    # Update the target model at the end of each episode
    agent.update_target_model()

print("Wandering and map-learning with complex grid complete")
