extends CharacterBody2D

var entered = false
var timeline = "Lavka"


func _ready() -> void:
	entered = false

var interacted = false
func _process(delta: float) -> void:
	if not entered:
		return

	if !interacted:
		Dialogic.start(timeline)
		interacted = true
	
	get_viewport().set_input_as_handled()

func _on_body_entered(_body: PhysicsBody2D):
	entered = true

func _on_body_exited(_body: PhysicsBody2D):
	entered = false
	interacted = false
