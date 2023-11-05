extends Node2D

var fruit = preload("res://fruit.tscn")
@onready var showPeice = fruit.instantiate() as RigidBody2D

@onready var fruit_idx = randi() % 4
signal on_spawn(idx : int)
var isSpawning : bool = true;

func _ready():
	showPeice.freeze = true
	showPeice.position.y = -1000
	showPeice.position.x = 0
	add_child(showPeice)
	on_spawn.emit(fruit_idx)
	
func spawn():
	showPeice = fruit.instantiate() 
	showPeice.position.y = -1000
	showPeice.position.x = get_global_mouse_position().x
	%PlayerLine.position.x = get_global_mouse_position().x
	%PlayerLine.modulate.a = 1
	showPeice.idx = fruit_idx
	showPeice.freeze = true
	add_child(showPeice)
	get_next_fruit()
	isSpawning = true
	
	
func get_next_fruit():
	fruit_idx = randi() % 3
	on_spawn.emit(fruit_idx)
	
func _process(delta):
	if (showPeice.freeze == true) :
		showPeice.position.x = get_global_mouse_position().x
		%PlayerLine.position.x = get_global_mouse_position().x
	
	
func _input(event):
	if event.is_action_released("drop") and isSpawning:
		isSpawning = false
		showPeice.freeze = false
		var wait_time = fruit_idx * 0.5
		wait_time = maxf(wait_time, 0.5)
		var tween = create_tween()
		tween.tween_property(%PlayerLine,"modulate:a",0.0,0.1).from(1.0)
		await get_tree().create_timer(wait_time).timeout
		spawn()
		
	
		
		
		
