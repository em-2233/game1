extends Node2D
class_name HealthComponent

@export var max_health : float = 10
var health : float

func _ready() -> void:
	health = max_health


func damage(damage_amount : float) -> void:
	health -= damage_amount
	if health <= 0:
		#if get_parent():
		get_parent().queue_free()
