extends Node


var _pixel_sort: float = 0
var _bug_effect: float = 0
var _pixel_blackout: float = 0

func set_pixel_sort(val: float) -> void:
	_pixel_sort = clamp(val, 0, 1)
	
func set_bug_effect(val: float) -> void:
	_bug_effect = clamp(val * 2 , 0, 1)
	
func set_pixel_blackout(val: float) -> void:
	_pixel_blackout= clamp(val * 2 , 0, 1.3)
	
