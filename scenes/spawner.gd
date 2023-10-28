extends Node2D

var fruit = preload("res://fruit.tscn")
@onready var showPeice = fruit.instantiate() as RigidBody2D

@onready var fruit_idx = randi() % 4
signal on_spawn(idx : int)


func _ready():
	showPeice.freeze = true
	showPeice.position.y = -1000
	add_child(showPeice)
	on_spawn.emit(fruit_idx)
	
	
	
func spawn():
	showPeice = fruit.instantiate() 
	showPeice.position.y = -1000
	showPeice.position.x = get_global_mouse_position().x
	showPeice.idx = fruit_idx
	showPeice.freeze = true
	add_child(showPeice)
	get_next_fruit()
	
func get_next_fruit():
	fruit_idx = randi() % 3
	on_spawn.emit(fruit_idx)
	
	
	

func _process(delta):

	if (showPeice.freeze == true) :
		showPeice.position.x = get_global_mouse_position().x
	
	
func _input(event):
	if event.is_action_released("drop"):
		showPeice.freeze = false
		var wait_time = fruit_idx * 0.5
		wait_time = maxf(wait_time, 0.5)
		await get_tree().create_timer(wait_time).timeout
		spawn()
		
	
		
		
		
