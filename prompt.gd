extends CharacterBody2D
const bulletScene = preload("res://playerBullet.tscn")
const portalScene = preload("res://portalBullet.tscn")

const SPEED = 400.0
const ROTSPEED = 5.0

func _physics_process(_delta):
	if Input.is_action_just_pressed("spacebar"):
		shoot()
	if Input.is_action_just_pressed("W"):
		portal(true)
	if Input.is_action_just_pressed("S"):
		portal(false)
	var direction = Input.get_vector(
		'ui_left', 'ui_right', 'ui_up', 'ui_down')
	var rotationAxis = Input.get_axis("A", "D")
	
	if rotationAxis != 0:
		rotation += ROTSPEED * rotationAxis * _delta
	if direction.length():
		velocity = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, 20)
		velocity.y = move_toward(velocity.y, 0, 20)

	move_and_slide()
	position.x = clamp(position.x, 8, 632)
	position.y = clamp(position.y, 40, 472)

func shoot():
	var bullet = bulletScene.instantiate() 
	bullet.global_position = $Marker2D.global_position  
	bullet.rotation = $Marker2D.global_rotation            
	get_tree().get_current_scene().add_child(bullet)  
	bullet.add_to_group("bullets")

func portal(portalVal):
	var portal = portalScene.instantiate() 
	portal.global_position = $Marker2D.global_position  
	portal.rotation = $Marker2D.global_rotation
	get_tree().get_current_scene().add_child(portal)
	portal.setup(portalVal)
