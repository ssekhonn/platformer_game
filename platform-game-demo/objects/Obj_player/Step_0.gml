//################ INPUTS ################
// Determine left or right movement
move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
move_x *= move_speed;

// Check if jumping
var jump_speed = 0; // Initialize jump_speed for safety
var jump_pressed = keyboard_check_pressed(vk_space); // Change from "var" to a persistent variable if needed

//################ CHECK FOR COLLISIONS ################
// Check if standing on ground
is_grounded = place_meeting(x, y+2, obj_ground);

// Check if touching a ladder
is_climbing = place_meeting(x, y, Obj_ladder);

//################ MOVEMENT ################
// CLIMBING
if (is_climbing) {
    move_y = keyboard_check(vk_down) - keyboard_check(vk_up);
    move_y *= climb_speed;
} else {
    // Jumping
    if (is_grounded && jump_pressed) {
        move_y = -jump_speed; // Usually, jump speed is negative to move upwards
    } else if (move_y < max_fall_speed) {
        move_y += gravity_force; // Apply gravity
    }
}

//################ ACTUALLY MOVE THE PLAYER OBJECT ################
move_and_collide(move_x, move_y, obj_ground);
