extends KinematicBody2D


const SPEED = 15000
var angle = 11

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
	if Input.is_action_just_pressed("ui_debug"):
		pass
	var collision = move_and_slide(direction.normalized()*SPEED*delta)
	update_animation(direction)

	$Sprite.rotation = get_local_mouse_position().angle()+angle
	
func update_animation(direction):
	if(direction==Vector2()):
		$Sprite.Idle()
	elif direction.y==1:
		$Sprite.Walk()
	elif direction.y==-1:
		$Sprite.Walk()
	elif direction.x==-1:
		$Sprite.Walk()
	elif direction.x==1:
		$Sprite.Walk()
