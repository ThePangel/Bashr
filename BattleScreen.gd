extends Node2D
const lsEnemy = preload("res://lsEnemy.tscn")
const player = preload("res://player.tscn")

func _ready() -> void:
	var player = player.instantiate()
	get_tree().get_current_scene().add_child(player)
	await get_tree().create_timer(5).timeout
	for n in range(10):
		var ls = lsEnemy.instantiate()
		get_tree().get_current_scene().add_child(ls)
		match randi_range(0, 3):
			0:
				ls.global_position = Vector2(randi_range(0, 640), 10)
			1:
				ls.global_position = Vector2(-10, randi_range(0, 480))
			2:
				ls.global_position = Vector2(randi_range(0, 640), -10)
			3:
				ls.global_position = Vector2(10, randi_range(0, 480))
		
		await get_tree().create_timer(5).timeout
