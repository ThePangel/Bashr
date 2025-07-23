extends Area2D

func _physics_process(delta):
	rotation += delta
	

func _on_body_entered(body) -> void:
	print(body.name)
	body.rotate(deg_to_rad(180))
	if Global.portals["bluePortal"] != null and Global.hasTeleported != body:
		body.global_position = Global.portals["bluePortal"].global_position
		Global.hasTeleported = body



func _on_area_entered(area: Area2D) -> void:
		if area != Global.hasTeleported:
			if Global.portals["bluePortal"] != null:
				var entry_portal_pos = global_position
				var exit_portal = Global.portals["bluePortal"]

				var entry_normal = get_portal_normal(entry_portal_pos)
				var exit_normal = get_portal_normal(exit_portal.global_position)
				
				var rotation_offset = exit_normal.angle() - entry_normal.angle() + PI
				
				area.rotate(rotation_offset)
				area.global_position = exit_portal.global_position
				Global.hasTeleported = area
				

	
func get_portal_normal(pos: Vector2) -> Vector2:
	if pos.x <= 0:
		return Vector2.RIGHT 
	if pos.x >= 640:
		return Vector2.LEFT
	if pos.y <= 0:
		return Vector2.DOWN 
	if pos.y >= 480:
		return Vector2.UP 
	return Vector2.ZERO 
