extends Node2D
const lsEnemy = preload("res://lsEnemy.tscn")
const nanoEnemy = preload("res://nanoEnemy.tscn")
const player = preload("res://player.tscn")

func _ready() -> void:
	var player = player.instantiate()
	get_tree().get_current_scene().add_child(player)
	await get_tree().create_timer(5).timeout
	for n in range(10):
		var ls = lsEnemy.instantiate()
		ls.global_position = getStartingPos()
		get_tree().get_current_scene().add_child(ls)
		
		if n > 5:
			for j in range(8):
				var nano = nanoEnemy.instantiate()                                                       
				nano.global_position = getStartingPos()
				get_tree().get_current_scene().add_child(nano)
				
		await get_tree().create_timer(5).timeout
		
func getStartingPos() -> Vector2:
	match randi_range(0, 3):
				0:
					return Vector2(randi_range(0, 640), -10)
				1:
					return Vector2(650, randi_range(0, 480))
				2:
					return Vector2(randi_range(0, 640), 490)
				3:
					return Vector2(-10, randi_range(0, 480))
	return Vector2.ZERO
