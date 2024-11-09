extends CharacterBody2D

@export var speed := 150
# Velocity that will gradually increase/decrease
var current_velocity := Vector2.ZERO

func _process(_delta: float) -> void:
	# Get the input direction vector directly
	var input_direction = Vector2(
		int(Input.is_action_pressed("d")) -
				int(Input.is_action_pressed("a")),
		int(Input.is_action_pressed("s")) -
				int(Input.is_action_pressed("w"))
	)

	input_direction = input_direction.normalized()
	current_velocity = input_direction * speed


	# Apply the smoothed velocity
	velocity = current_velocity
	move_and_slide()

## Could be used for slippery surfaces
	## Normalize if there's any input
	#if input_direction.length() > 0:
		#input_direction = input_direction.normalized()
		## No acceleration period
		#current_velocity = input_direction * speed
#
		## Smooth acceleration period
		##current_velocity = current_velocity.move_toward(
			##input_direction * speed, acceleration * delta)
	#else:
		## No deceleration period
		#current_velocity = input_direction * speed
		#
		## Smooth deceleration period
		##current_velocity = current_velocity.move_toward(
			##Vector2.ZERO, acceleration * delta)
