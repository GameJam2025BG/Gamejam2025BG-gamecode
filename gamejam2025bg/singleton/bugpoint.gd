extends Node

@export var bugpoint_active: bool = true
@export var bugpoint: Vector2 = Vector2(0,0)
@export var charecter: Vector2 = Vector2(0,0)
@export var max_distance: float = 100
@export var wiggle_room: float = 50
@export var out_of_bounds: bool = false
@export var return_vec: Vector2 = Vector2(0,0)
@export var distance = 0
@export var procent_effect = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if bugpoint_active:
		distance = bugpoint.distance_to(charecter)
		#print("distance: ", distance)
		procent_effect = distance / max_distance
		ShaderPower.set_bug_effect(procent_effect * 0.0015)
		ShaderPower.set_pixel_sort(pow(procent_effect, 1.5))
		
		return_vec = charecter.move_toward(bugpoint, 1)
		
		if distance > max_distance:
			out_of_bounds = true
		else:
			out_of_bounds = false
