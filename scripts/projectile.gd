extends CharacterBody2D

@export var SPEED = 100

var spawn_pos : Vector2
var spawn_rot : float
var dir : float

func _ready():
	global_position = spawn_pos
	global_rotation = spawn_rot
	
func _physics_process(_delta: float) -> void:
	velocity = Vector2(SPEED, 0).rotated(dir)
	move_and_slide()
