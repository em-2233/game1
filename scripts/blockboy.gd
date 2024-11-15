extends CharacterBody2D

@export var speed : float = 50
@export var  target : CharacterBody2D


#func _ready() -> void:
	#player = get_node("/root/demoMain/Player")

func _process(_delta: float) -> void:
	velocity = (target.global_position - global_position).normalized() * speed
	move_and_slide()
