extends Area2D

func _on_Goal_body_entered(body):
	if body.has_method("reach_goal"):
		body.reach_goal()
	pass # Replace with function body.
