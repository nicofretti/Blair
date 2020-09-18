extends KinematicBody2D


const SPEED = 300
func _process(delta):
	var direction = Vector2()
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y += -1
	if Input.is_action_pressed("ui_left"):
		direction.x += -1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	var collision = move_and_collide(direction.normalized()*SPEED*delta)
