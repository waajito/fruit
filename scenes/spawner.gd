extends Node2D

var fruit = preload("res://fruit.tscn")
@onready var showPeice = fruit.instantiate() as RigidBody2D




func _ready():
	showPeice.freeze = true
	showPeice.position.y = -1000
	add_child(showPeice)
	
	
func spawn():
	showPeice = fruit.instantiate() as RigidBody2D
	showPeice.position.y = -1000
	showPeice.position.x = get_global_mouse_position().x
	
	showPeice.freeze = true
	add_child(showPeice)
	
	

func _process(delta):
	if showPeice.freeze == true :
		showPeice.position.x = get_global_mouse_position().x
	
	
func _input(event):
	if event.is_action_released("drop"):
		showPeice.freeze = false
		await get_tree().create_timer(0.5).timeout
		spawn()
		
	
		
		
		
