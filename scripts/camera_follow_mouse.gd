# Drifts the camera with respect to the mouse position
extends Camera2D

var combat_mode : bool = false

func _process(delta: float) -> void:
	# Camera drift logic
	if combat_mode:
		position = lerp(position, get_local_mouse_position()/4, delta * 2)
	else:
		position = lerp(position, Vector2(0,0), delta * 3)
		
	position_smoothing_enabled = not combat_mode
		
# Toggles combat_mode with SPACE
func _input(event):
	if event.is_action_pressed('space'):
		if(combat_mode):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			combat_mode = false
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			combat_mode = true
