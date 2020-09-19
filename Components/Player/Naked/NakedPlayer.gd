extends "res://Components/Player/Player.gd"

const MIN_DIST = 30

func _process(delta):
	if Input.is_action_just_pressed("core_enter_exit"):
		var core = nearest_core()
		if core != null:
			enter()
			core.enter(self)

# Finds nearest node with tag "Core" or null
func nearest_core():
	var best_dist = INF
	var best_core = null
	
	for core in get_tree().get_nodes_in_group("Core"):
		var dist = global_position.distance_to(core.global_position)
		if dist < best_dist and dist < MIN_DIST:
			best_dist = dist
			best_core = core
			
	return best_core

func enter():
	get_tree().current_scene.remove_child(self)

func exit(core):
	global_position = core.global_position
	global_rotation = core.global_rotation
	$Camera.current = true
	core.get_tree().current_scene.add_child(self)
