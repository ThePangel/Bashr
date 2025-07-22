extends Area2D
var BluePortal = preload("res://BluePortal.tscn")
var speed = 750
var portal = true


func setup(portalVal: bool):
	portal = portalVal

func _physics_process(delta):
	if portal:
		$Label.add_theme_color_override("font_color", Color.ORANGE)
	else:
		$Label.add_theme_color_override("font_color", Color.BLUE)
	position += transform.x * speed * delta
	if position.x >= 640 or position.x <= 0: 
		if portal:
			print()
		else:
			
			var bluePortal = BluePortal.instantiate()
			bluePortal.global_position = global_position
			get_tree().get_current_scene().add_child(bluePortal) 
			if "bluePortal" in Global.portals and Global.portals["bluePortal"]:
				Global.portals["bluePortal"].queue_free()
			Global.portals["bluePortal"] = bluePortal
		queue_free()
	elif position.y >= 480 or position.y <= 0:
		if portal:
			print()
		else:
			var bluePortal = BluePortal.instantiate()
			bluePortal.global_position = global_position
			get_tree().get_current_scene().add_child(bluePortal) 
			if "bluePortal" in Global.portals and Global.portals["bluePortal"]:
				Global.portals["bluePortal"].queue_free()
			Global.portals["bluePortal"] = bluePortal
		queue_free()
