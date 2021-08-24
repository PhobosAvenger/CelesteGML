///scr_get_input
function Inputs() {

	// Arrow Keys
	right_key = keyboard_check(vk_right)
	left_key = keyboard_check(vk_left)
	up_key = keyboard_check(vk_up)
	down_key = keyboard_check(vk_down)

	// Act Keys
	dash_key = keyboard_check_pressed(ord("X"));
	jump_key = keyboard_check_pressed(ord("C"));

}
