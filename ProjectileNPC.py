import random
import numpy as np
from NPC import NPC


# Define the ProjectileEnemy class
class ProjectileEnemy(NPC):
    def __init__(self, health=1, grid_size=(10, 10), hidden_dim=64, learning_rate=0.001, gamma=0.99, epsilon=1.0, epsilon_decay=0.995, epsilon_min=0.1):
        """Initialize the ProjectileEnemy with AI models for actions and map learning."""
        input_dim = grid_size[0] * grid_size[1] * 2
        ACTIONS = ["stand_still", "launch_projectile", "jump", "move"]
        NUM_ACTIONS = len(ACTIONS)
        super().__init__(health, input_dim, hidden_dim, NUM_ACTIONS, grid_size, detect_range=5)
        
        # Assign the ProjectileEnemyAgent to the ProjectileEnemy
        self.npc_ai = ProjectileEnemyAgent(state_dim=input_dim, hidden_dim=hidden_dim, lr=learning_rate, gamma=gamma, epsilon=epsilon, epsilon_decay=epsilon_decay, epsilon_min=epsilon_min)
        
        # Position initialization
        self.position = (random.randint(0, grid_size[0] - 1), random.randint(0, grid_size[1] - 1))
        self.ACTIONS = ACTIONS
        self.grid_size = grid_size

    def encode_state(self, player_position):
        """Generate a combined state input for decision-making."""
        return np.concatenate([self.position, player_position])

    def move_and_act(self, player_position):
        """Decide and execute an action based on the AI model."""
        state = self.encode_state(player_position)
        action_index = self.npc_ai.select_action(state, player_position, self.position)

        if self.ACTIONS[action_index] == 'stand_still':
            print("ProjectileEnemy stands still.")
        elif self.ACTIONS[action_index] == 'launch_projectile' and self.detect_player(player_position):
            self.launch_projectile(player_position)
        elif self.ACTIONS[action_index] == 'jump':
            self.jump()
        elif self.ACTIONS[action_index] == 'move':
            self.move_toward(player_position)

        # Update and train model
        next_state = self.encode_state(player_position)
        reward = self.npc_ai.calculate_reward(self.position, player_position)
        done = False  # The ProjectileEnemy typically stays in place unless repositioning
        self.npc_ai.store_experience(state, action_index, reward, next_state, done)
        self.npc_ai.train()

    def launch_projectile(self, player_position):
        """Simulate launching a projectile toward the player."""
        print(f"ProjectileEnemy launches a projectile at the player at {player_position}!")

    def jump(self):
        """Simulate jumping in place."""
        print("ProjectileEnemy jumps in place to reposition or avoid an attack!")

    def move_toward(self, target_position):
        """Move one step closer to a target position (if needed for advanced repositioning)."""
        px, py = target_position
        nx, ny = self.position
        if abs(px - nx) > abs(py - ny):  # Prioritize vertical movement
            self.position = (nx + (1 if px > nx else -1), ny)
        else:  # Prioritize horizontal movement
            self.position = (nx, ny + (1 if py > ny else -1))
        print(f"ProjectileEnemy moves toward {target_position}, now at {self.position}.")

    def calculate_reward(self, player_position):
        """Determine reward based on specific actions or behaviors."""
        return self.npc_ai.calculate_reward(self.position, player_position)

# Example usage
grid_size = (10, 10)
projectile_enemy = ProjectileEnemy(health=1, grid_size=grid_size)

player_position = (5, 5)
for _ in range(10):  # Simulate behavior for 10 steps
    projectile_enemy.move_and_act(player_position)
