extends ColorRect

var shade: float = 200

func _process(delta: float) -> void:
	shade += delta * 5
	material.set_shader_parameter("scanline_count", shade)
