extends ColorRect

func _process(delta: float) -> void:
	material.set_shader_parameter("sort", ShaderPower._pixel_sort)
