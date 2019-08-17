extends RigidBody2D

func split():
	var clone = duplicate()
	clone.position.y -= 20
	position.y += 20
	clone.apply_impulse(Vector2(0,0), Vector2(0, -200))
	clone.get_node("Label").text = "-"
	self.apply_impulse(Vector2(0,0), Vector2(0, 200))
	get_parent().add_child(clone)
	State.chars += 1

func die():
	State.chars -= 1
	#$Die.stream = 
	$Die.play(0)

func _on_Die_finished():
	queue_free()
