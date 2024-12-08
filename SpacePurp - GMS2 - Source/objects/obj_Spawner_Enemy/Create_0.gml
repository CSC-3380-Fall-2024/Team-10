/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 3C2E7DE4
/// @DnDArgument : "code" "/// @description Initializes the wave system, setting up the timer, wave data, and enemy configuration for each wave.$(13_10)/// @param {integer} timer - The timer used to control the time intervals between waves (reset at the start).$(13_10)/// @param {integer} current_wave - The current wave index (starts from 0 for the first wave).$(13_10)/// @param {array} waves - An array that defines the properties of each wave, including the timer and enemy configuration.$(13_10)$(13_10)timer = 0;$(13_10)current_wave = 0;$(13_10)$(13_10)// Define wave data with settings for each wave's timer and enemy configuration$(13_10)waves = [$(13_10)    { // Wave 1$(13_10)        timer: room_speed * 5, // The timer duration for this wave (5 seconds in the room speed)$(13_10)        enemies: {$(13_10)            _count: 6, // Number of enemies to spawn in this wave$(13_10)            _object: obj_Asteroid, // The object type for the enemies in this wave$(13_10)            _x: room_width + 64, // Starting x-position of enemies (off the screen to the right)$(13_10)            _y: room_height / 2, // Starting y-position of enemies (center of the screen)$(13_10)            _x_padding: 38, // Horizontal distance between each enemy$(13_10)            _y_padding: 0, // Vertical distance between each enemy$(13_10)        }$(13_10)    },$(13_10)    { // Wave 2$(13_10)        timer: room_speed * 8, // Timer for this wave (8 seconds)$(13_10)        enemies: {$(13_10)            _count: 6, // 6 enemies for this wave$(13_10)            _object: obj_Asteroid, // Same enemy object type$(13_10)            _x: room_width + 64, // Enemies spawn off the right side of the screen$(13_10)            _y: 64, // Enemies start at 64 pixels from the top$(13_10)            _x_padding: 0, // No horizontal padding between enemies$(13_10)            _y_padding: 38, // Vertical padding between each enemy$(13_10)        }$(13_10)    },$(13_10)    { // Wave 3$(13_10)        timer: room_speed * 8, // Timer for this wave$(13_10)        enemies: {$(13_10)            _count: 6, // 6 enemies$(13_10)            _object: obj_Asteroid, // Same enemy object$(13_10)            _x: room_width + 64, // Enemies spawn off the screen$(13_10)            _y: room_height - 64, // Enemies start at 64 pixels from the bottom$(13_10)            _x_padding: 0, // No horizontal padding$(13_10)            _y_padding: -38, // Negative vertical padding for downward spacing$(13_10)        }$(13_10)    },$(13_10)    { // Wave 4$(13_10)        timer: room_speed * 8, // Timer for this wave$(13_10)        enemies: {$(13_10)            _count: 6, // 6 enemies$(13_10)            _object: obj_Asteroid, // Same enemy object type$(13_10)            _x: room_width + 64, // Enemies spawn off the screen to the right$(13_10)            _y: room_height / 2, // Enemies start at the center vertically$(13_10)            _x_padding: 38, // Horizontal padding between enemies$(13_10)            _y_padding: 0, // Vertical padding remains 0 for this wave$(13_10)        }$(13_10)    }$(13_10)];$(13_10)"
/// @description Initializes the wave system, setting up the timer, wave data, and enemy configuration for each wave.
/// @param {integer} timer - The timer used to control the time intervals between waves (reset at the start).
/// @param {integer} current_wave - The current wave index (starts from 0 for the first wave).
/// @param {array} waves - An array that defines the properties of each wave, including the timer and enemy configuration.

timer = 0;
current_wave = 0;

// Define wave data with settings for each wave's timer and enemy configuration
waves = [
    { // Wave 1
        timer: room_speed * 5, // The timer duration for this wave (5 seconds in the room speed)
        enemies: {
            _count: 6, // Number of enemies to spawn in this wave
            _object: obj_Asteroid, // The object type for the enemies in this wave
            _x: room_width + 64, // Starting x-position of enemies (off the screen to the right)
            _y: room_height / 2, // Starting y-position of enemies (center of the screen)
            _x_padding: 38, // Horizontal distance between each enemy
            _y_padding: 0, // Vertical distance between each enemy
        }
    },
    { // Wave 2
        timer: room_speed * 8, // Timer for this wave (8 seconds)
        enemies: {
            _count: 6, // 6 enemies for this wave
            _object: obj_Asteroid, // Same enemy object type
            _x: room_width + 64, // Enemies spawn off the right side of the screen
            _y: 64, // Enemies start at 64 pixels from the top
            _x_padding: 0, // No horizontal padding between enemies
            _y_padding: 38, // Vertical padding between each enemy
        }
    },
    { // Wave 3
        timer: room_speed * 8, // Timer for this wave
        enemies: {
            _count: 6, // 6 enemies
            _object: obj_Asteroid, // Same enemy object
            _x: room_width + 64, // Enemies spawn off the screen
            _y: room_height - 64, // Enemies start at 64 pixels from the bottom
            _x_padding: 0, // No horizontal padding
            _y_padding: -38, // Negative vertical padding for downward spacing
        }
    },
    { // Wave 4
        timer: room_speed * 8, // Timer for this wave
        enemies: {
            _count: 6, // 6 enemies
            _object: obj_Asteroid, // Same enemy object type
            _x: room_width + 64, // Enemies spawn off the screen to the right
            _y: room_height / 2, // Enemies start at the center vertically
            _x_padding: 38, // Horizontal padding between enemies
            _y_padding: 0, // Vertical padding remains 0 for this wave
        }
    }
];