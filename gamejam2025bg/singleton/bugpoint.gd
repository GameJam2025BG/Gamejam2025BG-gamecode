extends Node

@export var bugpoint_active: bool = true
@export var bugpoint: Vector2 = Vector2(0,0)
@export var charecter: Vector2 = Vector2(0,0)
@export var max_distance: float = 1000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if bugpoint_active:
		var distance = bugpoint.distance_to(charecter)
		#print("distance: ", distance)
		var procent_effect = distance / max_distance
		ShaderPower.set_bug_effect(procent_effect * 0.02)
		ShaderPower.set_pixel_sort(procent_effect * 2)
