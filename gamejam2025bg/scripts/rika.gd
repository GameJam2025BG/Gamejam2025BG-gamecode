extends CharacterBody2D

@export var is_iteractable: bool = true

@export var is_cutscene: bool = false

@export var cutscene_name: String = "main";

@export var is_bubble: bool = false

@export var is_bugpoint: bool = false

@export var text: Array[String] = ["i have 1 dialog and no input!"]

@onready var question_mark = $question_mark

var entered = false
var timeline = "Some Creature I"

func _ready() -> void:
	if is_bugpoint:
		Bugpoint.bugpoint = self.position
	entered = false

var interacted = false
func _process(delta: float) -> void:
	
	if !interacted:
		question_mark.visible = true
	else:
		question_mark.visible = false
	
	if not entered:
		return
	if is_bugpoint:
		Bugpoint.bugpoint = self.position
		
	
	if is_bubble:
		var layout = Dialogic.Styles.load_style("bubble")
		layout.register_character(load("res://dialogic/characters/Some Creature.dch"), self)
	
	if !interacted && is_iteractable && !is_cutscene:
		DialogManager.start_dialog(position, text)
		interacted = true
		print("interacted")
		
	if !interacted && is_iteractable && is_cutscene:
		Dialogic.start(cutscene_name)
		interacted = true
	
	
	get_viewport().set_input_as_handled()

func _on_body_entered(body: PhysicsBody2D):
	entered = true

func _on_body_exited(body: PhysicsBody2D):
	entered = false
	interacted = false


func _on_tree_entered() -> void:
	if is_bugpoint:
		Bugpoint.bugpoint = self.position
	pass # Replace with function body.
