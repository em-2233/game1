extends Area2D


@export var speed : int = 250
@export var damage : float = 10
var spawn_pos : Vector2
var spawn_rot : float
var dir : float
var velocity : Vector2


func _ready():
	# spawn position offset to spawn at tip of wand
	global_position = spawn_pos + Vector2(20,0).rotated(dir)
	global_rotation = spawn_rot
	
	
func _physics_process(delta: float) -> void:
	# set velocity and send projectile in motion
	velocity = Vector2(speed, 0).rotated(dir)
	position += velocity * delta
	
	
func _on_body_entered(_body: Node2D) -> void:
	# delete projectile on collision
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	# if projectile hits a hitbox, do damage
	if area is HitboxComponent:
		area.damage(damage)
