extends ColorRect

func _process(delta: float) -> void:
	#print("bug effect: ", ShaderPower._bug_effect)
	material.set_shader_parameter("fade", ShaderPower._bug_effect)
