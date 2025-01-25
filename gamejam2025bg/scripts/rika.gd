extends CharacterBody2D

@export var is_iteractable: bool = true

@export var is_cutscene: bool = false

@export var cutscene_name: String = "main";

@export var text: Array[String] = ["i have 1 dialog and no input!"]

var entered = false

func _ready() -> void:
	entered = false

var interacted = false
func _process(delta: float) -> void:
	print("cutscene: ", is_cutscene)
	print(Dialogic.current_timeline == null)
	if entered && !interacted && is_iteractable && !is_cutscene:
		DialogManager.start_dialog(position, text)
		interacted = true
	if entered && !interacted && is_iteractable && is_cutscene:
		Dialogic.start(cutscene_name)
		get_viewport().set_input_as_handled()
		interacted = true

func _on_body_entered(body: PhysicsBody2D):
	entered = true

func _on_body_exited(body: PhysicsBody2D):
	entered = false
	interacted = false
