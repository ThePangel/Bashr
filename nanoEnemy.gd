extends Area2D
var launchDirection: Vector2 = Vector2.ZERO

func _ready() -> void:
	var player = get_parent().get_node("Player")
	look_at(player.global_position)
	launchDirection = (player.global_position - global_position).normalized()
	
func _on_body_entered(_body: Node2D) -> void:
	Global.health -= 10
	emit_signal("health_changed", Global.health)
	queue_free()
	
func _physics_process(delta: float) -> void:
	if launchDirection == Vector2.ZERO: 
		return
	position += launchDirection * 500 * delta
	if position.x >= 640 or position.y >= 480 or position.x <= -10 or position.y <= -10: 
		queue_free()
