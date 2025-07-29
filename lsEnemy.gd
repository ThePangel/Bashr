extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	Global.health -= 10
	emit_signal("health_changed", Global.health)
	
func _physics_process(delta: float) -> void:
	var player = get_parent().get_node("Player")
	var direction = (player.global_position - global_position).normalized()
	look_at(player.global_position.normalized())
	global_position += direction * delta * 200

   
  


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullets"):
		area.queue_free()
		queue_free()
