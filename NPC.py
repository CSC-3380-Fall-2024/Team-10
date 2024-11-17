# %%
from abc import ABC, abstractmethod
from AILibrary import NPCAIModel

# %%
class NPC(ABC):
    def __init__(self, health, input_dim, hidden_dim, num_actions, map_size, detect_range=3):
        """Initialize common properties for NPCs."""
        self.health = health
        self.detect_range = detect_range
        self.ai_model = NPCAIModel(input_dim, hidden_dim, num_actions, map_size)
        self.hidden = self.ai_model.init_hidden()

    @abstractmethod
    def move(self, *args):
        """Define the movement logic for the NPC."""
        pass

    @abstractmethod
    def attack(self, *args):
        """Define the attack logic for the NPC."""
        pass

    def detect_player(self, player_position, npc_position):
        """Detect if the player is within range."""
        px, py = player_position
        nx, ny = npc_position
        distance = abs(px - nx) + abs(py - ny)  # Manhattan distance (common in grid-based games)
        if distance <= self.detect_range:
            print(f"{self.__class__.__name__} detected the player at {player_position}!")
            return True
        return False


# %%
class BasicEnemy(NPC):
    def __init__(self, health=1, grid_size=(5, 5), attack_damage=10, detect_range=3):
        super().__init__(health, 5, 8, 4, grid_size, detect_range)
        self.grid_size = grid_size
        self.grid_memory = np.zeros(grid_size)  # Initialize map memory
        self.position = (2, 2)  # Starting position
        self.agent = DeepQAgent(input_dim=grid_size[0] * grid_size[1] + 2, hidden_dim=8, num_actions=5)
        self.attack_damage = attack_damage

    def encode_state(self):
        """Convert the NPC's position and map memory into a state tensor."""
        flat_grid = torch.tensor(self.grid_memory.flatten(), dtype=torch.float32)
        position = torch.tensor(self.position, dtype=torch.float32)
        return torch.cat((flat_grid, position))  # Concatenate grid memory and position

    def update_map_memory(self):
        """Mark the current position as visited."""
        x, y = self.position
        self.grid_memory[x, y] = 1  # Mark as visited

    def move(self):
        """Use DQN to decide the next move."""
        state = self.encode_state()
        action = self.agent.select_action(state)

        directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        if action < 4:  # Move in one of the four directions
            dx, dy = directions[action]
            new_position = (self.position[0] + dx, self.position[1] + dy)
            if self.is_valid_position(new_position):
                self.position = new_position
                self.update_map_memory()
                print(f"{self.__class__.__name__} moves to {self.position}.")
        else:
            print(f"{self.__class__.__name__} explores using DFS.")
            path = dfs_random_path_with_range(self.grid_memory, self.position, n=2, max_steps=5)
            self.position = path[-1]
            self.update_map_memory()

    def is_valid_position(self, pos):
        """Check if the position is within bounds and not blocked."""
        x, y = pos
        return 0 <= x < self.grid_size[0] and 0 <= y < self.grid_size[1] and self.grid_memory[x, y] == 0

    def update(self, reward, next_position, done):
        """Update the DQN after taking an action."""
        state = self.encode_state()
        next_state = self.encode_state()
        action = self.agent.select_action(state)
        self.agent.replay_buffer.push(state, action, reward, next_state, done)
        self.agent.train()






