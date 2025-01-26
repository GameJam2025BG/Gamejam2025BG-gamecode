extends Sprite2D

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if shape_idx != -1:
				get_tree().quit() 
