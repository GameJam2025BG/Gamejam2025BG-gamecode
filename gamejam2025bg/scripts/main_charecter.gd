extends CharacterBody2D

@onready var animation = $AnimationPlayer

@export var SPEED: float = 300.0
@export var RUN_SPEED: float = 600.0

var last_direction: Vector2 = Vector2(0, -1)

func _physics_process(delta: float) -> void:
	
	var speed: float = SPEED
	
	if InputTracker.running:
		speed = RUN_SPEED
	else:
		speed = SPEED
	
	
	if InputTracker.left || InputTracker.right || InputTracker.up || InputTracker.down:
		# Handle movement.
		if InputTracker.left:
			animation.play("walk_left")
			position.x -= speed * delta
			last_direction = Vector2(-1, 0)
		if InputTracker.right:
			animation.play("walk_right")
			position.x += speed * delta
			last_direction = Vector2(1, 0)
		if InputTracker.up:
			animation.play("walk_back")
			position.y -= speed * delta
			last_direction = Vector2(0, 1)
		if InputTracker.down:
			animation.play("walk_front")
			position.y += speed * delta
			last_direction = Vector2(0, -1)
	else:
		if last_direction == Vector2(0, -1):
			animation.play("idle_front")
		if last_direction == Vector2(0, 1):
			animation.play("idle_back")
		if last_direction == Vector2(1, 0):
			animation.play("idle_left")
		if last_direction == Vector2(-1, 0):
			animation.play("idle_right")
	

	move_and_slide()
