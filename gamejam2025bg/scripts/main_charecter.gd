extends CharacterBody2D

@onready var animation = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var footstep_player = $footstep_player
const step_frames = [1, 5, 9, 13, 3, 2, 11, 10]

@export var SPEED: float = 300.0
@export var RUN_SPEED: float = 600.0

var last_direction: Vector2 = Vector2(0, -1)

func _physics_process(delta: float) -> void:
	Bugpoint.charecter = position
	var speed: float = SPEED
	var velocity = Vector2.ZERO
	
	if InputTracker.running:
		speed = RUN_SPEED
	else:
		speed = SPEED
	
	# Handle movement.
	if InputTracker.left:
		velocity.x -= speed * delta
		last_direction = Vector2(-1, 0)
	if InputTracker.right:
		velocity.x += speed * delta
		last_direction = Vector2(1, 0)
	if InputTracker.up:
		velocity.y -= speed * delta
		last_direction = Vector2(0, 1)
	if InputTracker.down:
		velocity.y += speed * delta
		last_direction = Vector2(0, -1)
	
	velocity = velocity.normalized()
	position += velocity
	move_and_slide()
	
	if velocity == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("idle")
	else:
		$AnimationTree.get("parameters/playback").travel("walk")
		$AnimationTree.set("parameters/idle/blend_position", velocity)
		$AnimationTree.set("parameters/walk/blend_position", velocity)
	


func _on_sprite_2d_frame_changed() -> void:
	var current_state = $AnimationTree.get("parameters/playback").get_current_node()
	if current_state == "idle": return
	if sprite.frame in step_frames: 
		footstep_player.playing = true
		print("footstep")
	print("real")
