extends Panel

func game_over():
	show()
	$VBoxContainer/Label.text = "You finished with %d clones" % State.in_goal
