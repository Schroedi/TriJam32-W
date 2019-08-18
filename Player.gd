extends Node2D


func _process(delta):
	if State.in_goal == State.chars:
		get_node("../UI/GameOver").game_over()

func _unhandled_input(event:InputEvent):
	if event.is_action_pressed("key_split"):
		if State.splits_rem > 0:
			State.splits_rem -= 1
			get_tree().call_group("Chars", "split")
			$Duplicate.play(0)
