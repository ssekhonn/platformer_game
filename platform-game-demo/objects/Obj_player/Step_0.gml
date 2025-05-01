// Determine left or right movement
move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
move_x *= move_speed;

// Check if jumping
jump_pressed = keyboard_check_pressed(vk_space); // This is now correctly stored as an instance variable

// Check for collisions
is_grounded = place_meeting(x, y+2, obj_ground);
is_climbing = place_meeting(x, y, Obj_ladder);

// Movement logic
if (is_climbing) {
    move_y = keyboard_check(vk_down) - keyboard_check(vk_up);
    move_y *= climb_speed;
} else {
    if (is_grounded && jump_pressed) {
        move_y = jump_speed;
    } else if (move_y < max_fail_speed) {
        move_y += gravity_force;
    }
}

// Move the player object
move_and_collide(move_x, move_y, obj_ground);

// Restart the room if outside bounds
if (y < -20 || y > room_height + 20) {
    room_restart();
}
