extends Node2D

@onready var main = get_tree().get_root().get_node("demoMainCHANGEME")
@onready var projectile = load("res://scenes/projectile.tscn")


func _ready() -> void:
	pass # Replace with function body.


func _shoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	instance.spawnRot = rotation
	main.add_child.call_deferred(instance)

func _input(_event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_SPACE):
		_shoot()
