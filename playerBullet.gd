extends Area2D

var speed = 600

func _physics_process(delta):
	position += transform.x * speed * delta
	if position.x >= 640 or position.y >= 480: 
		queue_free()
	
