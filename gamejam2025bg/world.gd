extends Node2D

func load_bubble():
	var layout = Dialogic.Styles.load_style("bubble")
	layout.register_character(load("res://dialogic/characters/RikaBubble.dch"), $"Main_Charecter")
	layout.register_character(load("res://dialogic/characters/PlayerBubble.dch"), $"Main_Charecter")
	layout.register_character(load("res://dialogic/characters/Some Creature.dch"), $"dolphin")
	layout.register_character(load("res://dialogic/characters/Another Creature.dch"), $"peepy")
	
	print("Bubble style loaded")

func _on_dialogic_signal(argument: String):
	if argument == "load_bubble":
		load_bubble()
		
	
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
