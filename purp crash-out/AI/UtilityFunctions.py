# %%
import random

def dfs_random_path_with_range(grid, start, n, max_steps=10):
    """Generate a random path on the grid using DFS within a limited range."""
    rows, cols = len(grid), len(grid[0])
    path = [start]  # Store the path as a list of (x, y) coordinates
    visited = set([start])  # Keep track of visited positions

    def in_range(pos):
        """Check if the position is within range n from the starting point."""
        x, y = pos
        sx, sy = start
        return abs(x - sx) + abs(y - sy) <= n  # Manhattan distance

    def neighbors(pos):
        """Get all valid neighbors within the allowed range."""
        x, y = pos
        moves = [(x + 1, y), (x - 1, y), (x, y + 1), (x, y - 1)]  # Down, Up, Right, Left
        valid_moves = [
            (nx, ny) for nx, ny in moves
            if 0 <= nx < rows and 0 <= ny < cols and grid[nx][ny] == 0
            and (nx, ny) not in visited and in_range((nx, ny))
        ]
        random.shuffle(valid_moves)  # Shuffle for randomness
        return valid_moves

    def dfs(pos, steps):
        """Recursive DFS to explore the grid."""
        if steps >= max_steps:
            return  # Stop if the maximum number of steps is reached

        for neighbor in neighbors(pos):
            visited.add(neighbor)
            path.append(neighbor)
            dfs(neighbor, steps + 1)
            break  # Stop after exploring one branch (to ensure randomness)

    dfs(start, 0)
    return path


