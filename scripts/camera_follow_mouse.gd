# Drifts the camera towards the mouse relative to the player
extends Camera2D

@export var player : CharacterBody2D
@export var maxDrift : float = 30
var playerPosition : Vector2
var mousePosition : Vector2
var driftDirection : Vector2
var mouseHidden : bool = true

func _ready() -> void:
	# Hides mouse on start
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _process(delta: float) -> void:
	# Camera drift logic
	if player:
		playerPosition = player.global_position
		mousePosition = get_global_mouse_position()
		driftDirection = mousePosition - playerPosition
		if driftDirection.length() > maxDrift:
			driftDirection = driftDirection.normalized() * maxDrift
		
		position = lerp(position, driftDirection , delta * 3)
		
# Toggles mouse visibility with ESC key
func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		if(mouseHidden):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			mouseHidden = false
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			mouseHidden = true
