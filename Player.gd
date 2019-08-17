extends Node2D


func _process(delta):
	# follow the leader
	var x = 0
	for c in get_node("../../Chars").get_children():
		var ci:Node2D = c
		x = max(x, ci.position.x)
	position.x = x


func _unhandled_key_input(event):
	if Input.is_action_pressed("key_split"):
		if State.splits_rem > 0:
			State.splits_rem -= 1
			get_tree().call_group("Chars", "split")
