extends Node2D

func _ready() -> void:
	Dialogic.start('Welcome')
#func _input(event: InputEvent) -> void:
	#if Dialogic.current_timeline != null:
		#return
#
	#if event is InputEventKey and event.pressed:
		#if event.keycode == KEY_H:
			#print(1)
			#var layout = Dialogic.Styles.load_style("bubble")
			#layout.register_character(load("res://dialogic/characters/Some Creature.dch"), $"NPC1Marker")
			#Dialogic.start("Some Creature I")
		#elif event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
			#print(2)
			#Dialogic.Styles.load_style("boxed novela")
			#Dialogic.start('main')
			#
		#get_viewport().set_input_as_handled()
