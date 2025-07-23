extends Area2D
var BluePortal = preload("res://BluePortal.tscn")
var OrangePortal = preload("res://OrangePortal.tscn")
var speed = 750
var portal = true


func setup(portalVal: bool):
	portal = portalVal

func _physics_process(delta):
	position += transform.x * speed * delta
	if portal:
		$Label.add_theme_color_override("font_color", Color.ORANGE)
		var orangePortal = OrangePortal.instantiate()
		
		if position.x >= 640 or position.x <= 0: 
			if Global.portals["orangePortal"]:
				Global.portals["orangePortal"].queue_free()
			orangePortal.global_position = Vector2(640 if position.x > 640 else 0, global_position.y) 
			get_tree().get_current_scene().add_child(orangePortal) 
			Global.portals["orangePortal"] = orangePortal
			queue_free()
			
		elif position.y >= 480 or position.y <= 0:
			if Global.portals["orangePortal"]:
				Global.portals["orangePortal"].queue_free()
			orangePortal.global_position = Vector2(global_position.x, 480 if position.y > 480 else 0) 
			get_tree().get_current_scene().add_child(orangePortal) 
			Global.portals["orangePortal"] = orangePortal
			queue_free()
			
		
		
	else:
		$Label.add_theme_color_override("font_color", Color.BLUE)
		var bluePortal = BluePortal.instantiate()
		
		
		if position.x >= 640 or position.x <= 0: 
			if Global.portals["bluePortal"]:
				Global.portals["bluePortal"].queue_free()
			bluePortal.global_position = Vector2(640 if position.x > 640 else 0, global_position.y) 
			get_tree().get_current_scene().add_child(bluePortal) 
			Global.portals["bluePortal"] = bluePortal
			queue_free()
		elif position.y >= 480 or position.y <= 0:
			if Global.portals["bluePortal"]:
				Global.portals["bluePortal"].queue_free()
			bluePortal.global_position = global_position
			get_tree().get_current_scene().add_child(bluePortal) 
			Global.portals["bluePortal"] = bluePortal
			queue_free()
			
		
		
	
	
	
	
