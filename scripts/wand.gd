extends Node2D

@export var camera : Camera2D
@onready var main = get_tree().get_root().get_node("demoMain")
@onready var projectile = load("res://scenes/projectile.tscn")
var x = 5
var t = true

func _ready() -> void:
	pass # Replace with function body.

func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())

func shoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawn_pos = global_position
	instance.spawn_rot = rotation
	main.add_child.call_deferred(instance)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('left_click'):
		shoot()
