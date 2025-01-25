extends CanvasLayer

signal on_transition_finished

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

func _ready():
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(anim_name: String):
	if anim_name == "fade_to_black":
		emit_signal("on_transition_finished")  # Emit signal correctly
		animation_player.play("fade_to_normal")
	elif anim_name == "fade_to_normal":  # Fixed condition to use `anim_name`
		color_rect.visible = false

func transition():
	color_rect.visible = true
	animation_player.play("fade_to_black")
