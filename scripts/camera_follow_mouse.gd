# Drifts the camera towards the mouse relative to the player
extends Camera2D

@export var player : CharacterBody2D
@export var max_drift : float = 30
var player_position : Vector2
var mouse_position : Vector2
var drift_direction : Vector2
var combat_mode : bool = false

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	# Camera drift logic
	if combat_mode:
		if player:
			player_position = player.global_position
			mouse_position = get_global_mouse_position()
			drift_direction = mouse_position - player_position
			if drift_direction.length() > max_drift:
				drift_direction = drift_direction.normalized() * max_drift
		
			position = lerp(position, drift_direction , delta * 3)
	position_smoothing_enabled = not combat_mode
		
# Toggles mouse visibility with ESC key
func _input(event):
	if event.is_action_pressed('space'):
		if(combat_mode):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			combat_mode = false
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			combat_mode = true
