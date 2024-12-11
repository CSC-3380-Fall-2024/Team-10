/// @description Creates instances for particles, enemy spawner, and UI elements at the start of the room.

#region PARTIALS
instance_create_depth(0, 0, depth, obj_Particle_Hit);  // Create a particle instance for hit effects
#endregion

#region ENEMY SPAWNER
instance_create_depth(0, 0, depth, obj_Spawner_Enemy);  // Create an enemy spawner instance to spawn enemies in the room
#endregion

#region UI
instance_create_depth(0, 0, depth, obj_UI_Score);  // Create the UI instance to display the score
#endregion
