extends Node2D

const character = preload("res://Scenes/Char.tscn")
const l0 = preload("res://Levels/Level0.tscn")
const l1 = preload("res://Levels/Level1.tscn")
const l2 = preload("res://Levels/Level2.tscn")

var lvl = null

func _ready():
	load_level(0)

func load_level(i:int):
	if lvl:
		lvl.queue_free()
	State.reset()
	
	var cam = get_node("Player/Camera2D")
	cam.zoom = Vector2(1,1)
	cam.offset = Vector2(0,0)
	
	for i in $Chars.get_children():
		i.queue_free()
	
	var c = character.instance()
	$Chars.add_child(c)
		
	if i == 0:
		lvl = l0.instance()
	elif i == 1:
		lvl = l1.instance()
	else:
		lvl = l2.instance()
	add_child(lvl)

func _on_Again_pressed():
	load_level(State.level)
	get_node("UI/GameOver").visible = false

func _on_Next_pressed():
	State.level += 1
	load_level(State.level)
	get_node("UI/GameOver").visible = false
