extends ColorRect

func _process(delta: float) -> void:
	material.set_shader_parameter("fade", ShaderPower._bug_effect)
