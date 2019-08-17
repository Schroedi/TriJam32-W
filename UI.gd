extends CanvasLayer

func _process(delta):
	$Panel/GridContainer/Us.text = str(State.chars)
	$Panel/GridContainer/Splits.text = str(State.splits_rem)
	$Panel/GridContainer/Goal.text = str(State.in_goal)
	$Panel/GridContainer/Level.text = str(State.level)
