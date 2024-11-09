extends Node2D

@export var velocity = 60
@export var roaming_range = 800
var starting_pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	starting_pos = position.x



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += velocity * delta
	if position.x > starting_pos + roaming_range or position.x < starting_pos:
		scale.x = -scale.x
		velocity = -velocity
		
