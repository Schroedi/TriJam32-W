extends Area2D



func _on_Powerup_body_entered(body):
	State.splits_rem += 1
	queue_free()
