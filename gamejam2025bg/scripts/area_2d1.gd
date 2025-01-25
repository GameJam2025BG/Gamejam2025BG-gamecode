extends Area2D

@export_file var dest_scene

var entered = false

func _on_body_entered(_body: PhysicsBody2D):
	entered = true

func _on_body_exited(_body: PhysicsBody2D):
	entered = false
 
func _physics_process (_delta):
	if entered and Input.is_action_just_pressed("ui_accept"):
		print("You pressed")
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://components/world2.tscn")
