extends CharacterBody2D

@export var SPEED = 100

var spawnPos : Vector2
var spawnRot : float
var dir : float

func _ready():
	global_position = spawnPos
	global_rotation = spawnRot
	
func _physics_process(delta: float) -> void:
	velocity = Vector2(SPEED, 0).rotated(dir)
	move_and_slide()
