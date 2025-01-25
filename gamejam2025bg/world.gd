extends Node2D

func _input(event: InputEvent) -> void:
	if Dialogic.current_timeline != null:
		return

	if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		print("starting")
		Dialogic.start('main')
		get_viewport().set_input_as_handled()
