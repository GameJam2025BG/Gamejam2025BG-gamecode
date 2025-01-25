extends CanvasLayer

signal on_transition_finished

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

# Scene to preload
var next_scene = preload("res://transition_screen.tscn") 
var new_scene_instance = null
var transitioning: bool = false

func _ready():
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)

# Emit signal and load the next scene after transition
func _on_animation_finished(anim_name: String):
	if anim_name == "fade_to_black":
		emit_signal("on_transition_finished")  # Emit signal correctly
		animation_player.play("fade_to_normal")
	elif anim_name == "fade_to_normal":  # Fixed condition to use `anim_name`
		color_rect.visible = false
	transitioning = false

# Start the transition to the next scene
func transition():
	if !transitioning:
		color_rect.visible = true
		animation_player.play("fade_to_black")
	transitioning = true

# Load the preloaded scene after the fade-out transition
