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
	update_animation(direction)
	
	var mpos = get_global_mouse_pos()
	look_at(mpos)
	

func update_animation(direction):
	if(direction==Vector2()):
		$Sprite.play("Idle")
		$Sprite.flip_v=false
	elif direction.y==1:
		$Sprite.play("Walk")
	elif direction.y==-1:
		$Sprite.play("Walk")
		$Sprite.flip_v=true
	elif direction.x==-1:
		$Sprite.play("Walk")
		$Sprite.flip_h=true
	elif direction.x==1:
		$Sprite.play("Run")
		$Sprite.flip_h=false
