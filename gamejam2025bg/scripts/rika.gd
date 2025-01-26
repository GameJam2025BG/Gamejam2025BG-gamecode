extends CharacterBody2D

@export var is_iteractable: bool = true

@export var is_cutscene: bool = false

@export var cutscene_name: String = "main";

@export var is_bubble: bool = false

@export var is_bugpoint: bool = false

@onready var question_mark = $question_mark

var entered = false
var timeline = "Some Creature I"

func _ready() -> void:
	if is_bugpoint:
		Bugpoint.bugpoint = self.position
	$AnimationTree.set("parameters/idle/blend_position", Vector2(0, 1))

var interacted = false
func _process(delta: float) -> void:
	if is_bugpoint:
		Bugpoint.bugpoint = self.position

func _on_tree_entered() -> void:
	if is_bugpoint:
		Bugpoint.bugpoint = self.position
	pass # Replace with function body.

#extends CharacterBody2D
#
#var entered = false
#var timeline = "Some Creature I"
#
#func _ready() -> void:
	#entered = false
#
#var interacted = false
#func _process(delta: float) -> void:
	#if not entered:
		#return
#
	#if !interacted:
		#Dialogic.start(timeline)
		#interacted = true
	#
	#get_viewport().set_input_as_handled()
#
#func _on_body_entered(_body: PhysicsBody2D):
	#entered = true
#
#func _on_body_exited(_body: PhysicsBody2D):
	#entered = false
	#interacted = false
