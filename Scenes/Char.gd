extends RigidBody2D

var in_goal = false
var is_dead = false

func split():
	if in_goal or is_dead:
		return
	
	var clone = duplicate()
	clone.position.y -= 20
	position.y += 20
	clone.apply_impulse(Vector2(0,0), Vector2(0, -200))
	clone.get_node("Label").text = "-"
	self.apply_impulse(Vector2(0,0), Vector2(0, 200))
	get_parent().add_child(clone)
	State.chars += 1

func die():
	if is_dead or in_goal:
		return
	is_dead = true
	State.chars -= 1
	#$Die.stream = 
	$Die.play(0)

func _on_Die_finished():
	queue_free()

func reach_goal():
	in_goal = true
	State.in_goal += 1


func _on_VisibilityNotifier2D_screen_exited():
	die()
