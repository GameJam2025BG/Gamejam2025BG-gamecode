extends CharacterBody2D

var entered = false

func _ready() -> void:
	entered = false

func _process(delta: float) -> void:
	print(entered)
	if entered:
		DialogManager.start_dialog(position, ["finger, hello there finger", "RczxczxcEAL"])

func _on_body_entered(body: PhysicsBody2D):
	entered = true

func _on_body_exited(body: PhysicsBody2D):
	entered = false
