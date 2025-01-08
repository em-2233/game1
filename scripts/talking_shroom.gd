extends CharacterBody2D

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
		if event.is_action_pressed('left_click'):
			print("clicked")
