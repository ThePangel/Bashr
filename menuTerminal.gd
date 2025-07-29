extends Label

func _ready() -> void:
	text = ":\\ > Bashr_"
	

func _unhandled_input(event : InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		var key_event := event as InputEventKey
		if !(key_event.keycode & KEY_SPECIAL) and text.length() < 25:
			var letter := String.chr(key_event.unicode)
			text = text.left(text.length() - 1)
			text = text + letter + "_"
			accept_event()
		
		if key_event.keycode == KEY_BACKSPACE and text.length() > 6 :
			
			text = text.left(text.length() - 2)
			text = text + "_"
		if key_event.keycode == KEY_ENTER and text == ":\\ > start_":
			get_tree().change_scene_to_file("res://Terminaltscn.tscn")
