import random
import torch
import numpy as np
from NPC import NPC
from AILibrary import WanderingAgent, NPCAgent

# %%
class BasicEnemyAgent(NPCAgent):
    def __init__(self, state_dim, hidden_dim=64, lr=0.001, gamma=0.99, epsilon=1.0, epsilon_decay=0.995, epsilon_min=0.1):
        """Initialize the BasicEnemy-specific agent with unique states and actions."""
        super().__init__(state_dim, hidden_dim, lr, gamma, epsilon, epsilon_decay, epsilon_min)
        self.ACTIONS = ["wander", "interact", "attack", "charge"]
        self.NUM_ACTIONS = len(self.ACTIONS)

    def select_action(self, state, player_position, npc_position, vision_range=5):
        """
        Select an action based on epsilon-greedy policy with enhanced behavior for the BasicEnemy.
        Includes a priority for attack if the player is within range.
        """
        if self.can_see_player(player_position, npc_position, vision_range):
            return self.ACTIONS.index('attack')  # Prioritize attack if the player is visible
        else:
            if random.random() < self.epsilon:
                return random.choice(range(self.NUM_ACTIONS))  # Explore with epsilon probability
            else:
                with torch.no_grad():
                    q_values = self.model(torch.tensor(state, dtype=torch.float32))
                    return torch.argmax(q_values).item()  # Choose the best action according to Q-values

    def can_see_player(self, player_position, npc_position, vision_range):
        """Check if the player is within the vision range of the NPC."""
        distance = np.linalg.norm(np.array(player_position) - np.array(npc_position))
        return distance <= vision_range

    def calculate_reward(self, npc_position, player_position):
        """Customize reward based on BasicEnemy behavior."""
        if npc_position == player_position:
            return 10 
        elif self.can_see_player(player_position, npc_position):
            return 5
        else:
            return 0.1

# %%
class BasicEnemy(NPC):
    def __init__(self, health=1, grid_size=(10, 10), hidden_dim=64, learning_rate=0.001, gamma=0.99, epsilon=1.0, epsilon_decay=0.995, epsilon_min=0.1):
        """Initialize the BasicEnemy with AI models for actions and map learning."""
        input_dim = grid_size[0] * grid_size[1] * 2
        ACTIONS = ["wander", "interact", "attack", "charge"]
        NUM_ACTIONS = len(ACTIONS)
        super().__init__(health, input_dim, hidden_dim, NUM_ACTIONS, grid_size, detect_range=3)
        
        # Assign AI models to the BasicEnemy
        self.npc_ai = NPCAgent(state_dim=input_dim, hidden_dim=hidden_dim, lr=learning_rate, gamma=gamma, epsilon=epsilon, epsilon_decay=epsilon_decay, epsilon_min=epsilon_min)
        self.map_agent = WanderingAgent(grid_size=grid_size, input_dim=input_dim, hidden_dim=hidden_dim, lr=learning_rate, gamma=gamma, epsilon=epsilon, epsilon_decay=epsilon_decay, epsilon_min=epsilon_min)
        
        # Position and map memory initialization
        self.position = (random.randint(0, grid_size[0] - 1), random.randint(0, grid_size[1] - 1))
        self.discovered_map = np.zeros(grid_size, dtype=int)
        self.ACTIONS = ACTIONS
        self.grid_size = grid_size

    def encode_state(self):
        """Generate a combined state input for decision-making and map learning."""
        return self.map_agent.get_state_representation(self.discovered_map, self.position)

    def move_and_act(self, player_position):
        """Decide and execute an action based on the AI model."""
        state = self.encode_state()
        action_index = self.npc_ai.select_action(state, player_position, self.position)

        if self.ACTIONS[action_index] == 'wander':
            self.wander()
        elif self.ACTIONS[action_index] == 'interact':
            print("BasicEnemy interacts with the environment.")
        elif self.ACTIONS[action_index] == 'attack' and self.detect_player(player_position):
            self.attack()
        elif self.ACTIONS[action_index] == 'charge':
            self.charge_toward_player(player_position)

        # Update map and train
        next_state = self.encode_state()
        reward = self.calculate_reward(player_position)
        done = self.position == player_position  # Check if the enemy reached the player
        self.npc_ai.store_experience(state, action_index, reward, next_state, done)
        self.npc_ai.train()

    def wander(self):
        """Choose a random valid move to explore."""
        action_index = self.map_agent.select_action(self.encode_state())
        self.move(action_index)

    def move(self, action_index):
        """Move in one of the four directions."""
        x, y = self.position
        if action_index == 0 and x > 0:  # Up
            self.position = (x - 1, y)
        elif action_index == 1 and x < self.grid_size[0] - 1:  # Down
            self.position = (x + 1, y)
        elif action_index == 2 and y > 0:  # Left
            self.position = (x, y - 1)
        elif action_index == 3 and y < self.grid_size[1] - 1:  # Right
            self.position = (x, y + 1)
        self.update_map_memory()
        print(f"BasicEnemy moves to {self.position}.")

    def charge_toward_player(self, player_position):
        """Move one step toward the player."""
        px, py = player_position
        nx, ny = self.position
        if abs(px - nx) > abs(py - ny):  # Prioritize vertical movement
            self.position = (nx + (1 if px > nx else -1), ny)
        else:  # Prioritize horizontal movement
            self.position = (nx, ny + (1 if py > ny else -1))
        self.update_map_memory()
        print(f"BasicEnemy charges toward {player_position}, now at {self.position}.")

    def update_map_memory(self):
        """Mark the current position as visited on the discovered map."""
        x, y = self.position
        self.discovered_map[x, y] = 1

    def calculate_reward(self, player_position):
        """Determine the reward based on proximity or actions."""
        if self.position == player_position:
            return 10  # High reward for reaching the player
        else:
            return 0.1  # Small exploration reward

    def attack(self):
        """Simulate an attack on the player."""
        print("BasicEnemy attacks the player!")

    def display_map_memory(self):
        """Display the discovered map."""
        print("\nDiscovered Map:")
        for row in self.discovered_map:
            print(" ".join(str(cell) for cell in row))

# Example usage
map_size = (10, 10)
basic_enemy = BasicEnemy(health=1, grid_size=map_size)

player_position = (5, 5)
for _ in range(10):  # Simulate behavior for 10 steps
    basic_enemy.move_and_act(player_position)
    basic_enemy.display_map_memory()
