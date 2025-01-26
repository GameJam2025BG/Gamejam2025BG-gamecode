extends Button

var normal_texture = preload("res://textures/button_normal.png")
var hover_texture = preload("res://textures/button_hover.png")
@onready var texture_rect = $TextureRect

func _process(delta: float) -> void:
	if Input.is_action_pressed("advance_dialog"):
		_on_pressed()
	pass

func _on_mouse_entered():
	print("HOVERED")
	texture_rect.texture = hover_texture

func _on_mouse_exited():
	print("NUH HOVERED")
	texture_rect.texture = normal_texture


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	pass 
