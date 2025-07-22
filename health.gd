extends Label

func _ready() -> void:
	update_health_display()

func update_health_display() -> void:
	var hp = Global.health
	text = ":\\ > " + str(hp)

	var col = Color.WHITE
	if hp > 75:
		col = Color.GREEN
	elif hp > 50:
		col = Color.YELLOW
	elif hp > 25:
		col = Color.ORANGE
	else:
		col = Color.RED


	add_theme_color_override("font_color", col)
