function car_init() {
    //------ Customizable Car Parameters ------//
    // Movement and Speed
    max_speed = 6.7;         // MAX SPEED: Maximum speed the car can attain (forward)
    max_speed_rev = 4;       // REVERSE SPEED: Maximum speed when reversing

    // Engine Forces
    engine_acc = 5.5;        // ACCELERATION: Forward force for moving forward
    engine_brk = 6;          // BRAKING: Force applied when braking
    engine_rev = 3;          // REVERSE FORCE: Backward force for reversing

    // Steering Parameters
    max_wheel_angle = 8;     // MAX STEERING ANGLE: Maximum angle the wheels can turn
    wheel_angle_velocity = 3; // STEERING SPEED: Speed of wheel rotation; higher values mean quicker turns

    // Torque (Turning Forces)
    torque_acc = 5.5;        // TORQUE: Extra force for turning (forward)
    torque_rev = 7;          // REVERSE TORQUE: Extra force for turning in reverse
    torque_damp = 1;         // ANGULAR DAMPING: How quickly the car straightens when not turning (range: 0-1)

    // Drifting Control
    drift = 1;               // DRIFT CONTROL: 0 = no drift, 1 = full control (values > 1 can add exaggerated drift)

    //------ Default/Runtime Car State ------//
    acc = 0;                 // ACCELERATION STATE: 0 = no movement, 1 = forward, -1 = reverse
    steer_dir = 0;           // STEERING DIRECTION: Angle for the wheels
    state = "idle";          // Default state: idle, moving, reversing

    //------ Wheels Initialization ------//
    wheels = [];             // Initialize empty array for wheels
    wheels[0] = noone;       // Placeholder for the first wheel (optional initialization)

    //------ Collision Variables ------//
    ai_col = false;          // Collision flag for AI
    ai_col_x = 0;            // Collision position X offset
    ai_col_y = 0;            // Collision position Y offset

}
