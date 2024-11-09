extends Node2D

@onready var main = get_tree().get_root().get_node("demoMainCHANGEME")
@onready var projectile = load("res://scenes/projectile.tscn")
var x = 5
var t = true

func _ready() -> void:
	pass # Replace with function body.


func shoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	instance.spawnRot = rotation
	main.add_child.call_deferred(instance)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('left_click'):
		shoot()
