extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func split():
	var clone = duplicate()
	get_parent().add_child(clone)
	State.chars += 1

func die():
	State.chars -= 1
	queue_free()
