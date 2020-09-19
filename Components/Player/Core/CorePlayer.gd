extends "res://Components/Player/Player.gd"

func set_alive(enabled):
	set_process(enabled)
	set_physics_process(enabled)

func _ready():
	set_alive(false)

func _process(delta):
	if Input.is_action_just_pressed("core_enter_exit"):
		exit()
		pilot.exit(self)
		pilot = null

var pilot

func enter(pilot_arg):
	set_alive(true)
	$Camera.current = true
	
	pilot = pilot_arg

func exit():
	set_alive(false)
	$Camera.current = false
