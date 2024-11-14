extends Area2D
class_name HitboxComponent

@export var health_component : HealthComponent

func damage(damage_amount : float):
	if health_component:
		health_component.damage(damage_amount)
