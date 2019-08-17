extends CanvasLayer

func _process(delta):
	$Panel/Us.text = str(State.chars)
	$Panel/Splits.text = str(State.splits_rem)
