extends Node2D

@export var velocity = 60
@export var range = 800
var startingPos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startingPos = position.x



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += velocity * delta
	if position.x > startingPos + range or position.x < startingPos:
		scale.x = -scale.x
		velocity = -velocity
		
