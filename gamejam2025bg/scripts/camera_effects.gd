extends Camera2D

@export var max_offset: float = 10.0
@export var offset_per_sec: float = 2.0

var offset_x: float = 0.0;
var offset_y: float = 0.0;

func _ready() -> void:
	offset = Vector2.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if InputTracker.right:
		offset.x = clamp(offset.x + offset_per_sec * delta, -max_offset, max_offset)
	else:
		if offset.x > 0:
			offset.x = offset.x - offset_per_sec * delta * 3
			
	if InputTracker.left:
		offset.x = clamp(offset.x - offset_per_sec * delta, -max_offset, max_offset)
	else:
		if offset.x < 0:
			offset.x = offset.x + offset_per_sec * delta * 3
	
	if InputTracker.up:
		offset.y = clamp(offset.y - offset_per_sec * delta, -max_offset, max_offset)
	else:
		if offset.y < 0:
			offset.y = offset.y + offset_per_sec * delta * 3
			
	if InputTracker.down:
		offset.y = clamp(offset.y + offset_per_sec * delta, -max_offset, max_offset)
	else:
		if offset.y > 0:
			offset.y = offset.y - offset_per_sec * delta * 3
