extends KinematicBody2D

const SPEED = 15000

# Updated after every physics step
var direction: Vector2

func _physics_process(delta):	
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_down"):
		direction += Vector2.DOWN
	if Input.is_action_pressed("ui_up"):
		direction += Vector2.UP
	if Input.is_action_pressed("ui_left"):
		direction += Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		direction += Vector2.RIGHT
	
	rotation += get_local_mouse_position().angle()
	move_and_slide(direction.normalized() * SPEED * delta)
