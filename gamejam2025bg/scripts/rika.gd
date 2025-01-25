extends CharacterBody2D

@export var is_iteractable: bool = true
@export var text: Array[String] = ["i have 1 dialog and no input!"]

var entered = false

func _ready() -> void:
	entered = false

var interacted = false
func _process(delta: float) -> void:
	print(entered)
	if entered && !interacted && is_iteractable:
		DialogManager.start_dialog(position, text)
		interacted = true

func _on_body_entered(body: PhysicsBody2D):
	entered = true

func _on_body_exited(body: PhysicsBody2D):
	entered = false
