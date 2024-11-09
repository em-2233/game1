# Drifts the camera towards the mouse relative to the player
extends Camera2D

@export var player : CharacterBody2D
@export var maxDrift : float = 30
var playerPosition : Vector2
var mousePosition : Vector2
var driftDirection : Vector2
var mouseHidden : bool = true
var combatMode : bool = false

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	# Camera drift logic
	if combatMode:
		if player:
			playerPosition = player.global_position
			mousePosition = get_global_mouse_position()
			driftDirection = mousePosition - playerPosition
			if driftDirection.length() > maxDrift:
				driftDirection = driftDirection.normalized() * maxDrift
		
			position = lerp(position, driftDirection , delta * 3)
	position_smoothing_enabled = !combatMode
		
# Toggles mouse visibility with ESC key
func _input(event):
	if event.is_action_pressed('space'):
		if(mouseHidden):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			mouseHidden = false
			combatMode = false
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			mouseHidden = true
			combatMode = true
