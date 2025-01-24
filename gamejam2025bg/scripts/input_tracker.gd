extends Node

var left: bool = false
var right: bool = false
var up: bool = false
var down: bool = false
var running: bool = false

func _process(delta: float) -> void:
	left = Input.is_action_pressed("move_left")
	right = Input.is_action_pressed("move_right")
	up = Input.is_action_pressed("move_up")
	down = Input.is_action_pressed("move_down")
	running = Input.is_action_pressed("Run")
