extends RigidBody2D

func split():
	var clone = duplicate()
	get_parent().add_child(clone)
	State.chars += 1

func die():
	State.chars -= 1
	#$Die.stream = 
	$Die.play(0)

func _on_Die_finished():
	queue_free()
