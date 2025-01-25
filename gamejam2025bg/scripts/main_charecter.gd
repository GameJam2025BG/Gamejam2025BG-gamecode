extends CharacterBody2D
@export var SPEED: float = 300.0
@export var RUN_SPEED: float = 600.0

func _physics_process(delta: float) -> void:
	var speed: float = SPEED
	
	if InputTracker.running:
		speed = RUN_SPEED
	else:
		speed = SPEED
	
	# Handle movement.
	if InputTracker.left:
		print("left")
		position.x -= speed * delta
	if InputTracker.right:
		print("right")
		position.x += speed * delta
	if InputTracker.up:
		print("up")
		position.y -= speed * delta
	if InputTracker.down:
		print("down")
		position.y += speed * delta

	move_and_slide()
