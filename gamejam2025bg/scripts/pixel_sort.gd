extends ColorRect

func _process(delta: float) -> void:
	#print("pixel sort: ", ShaderPower._pixel_sort)
	material.set_shader_parameter("sort", ShaderPower._pixel_sort)
