extends Node2D

@export var velocity = 60
@export var roaming_range = 800
var starting_pos

func _ready() -> void:
	# gets starting position
	starting_pos = position.x



func _process(delta: float) -> void:
	# sets blockguy in motion
	position.x += velocity * delta
	
	# flips blockguys direction and sprite when they reach range
	if position.x > starting_pos + roaming_range or position.x < starting_pos:
		scale.x = -scale.x
		velocity = -velocity
		
