extends Control

var scored : int = 0
@onready var score = %score

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	scored += 10
	score.text = str(scored)
	print("score : " + str(scored))
	

func _on_decrease_size_mouse_entered():
	var a = InputEventAction.new()
	a.action = "right"
	a.pressed = true
	Input.parse_input_event(a)


func _on_increase_size_mouse_entered():
	var a = InputEventAction.new()
	a.action = "left"
	a.pressed = true
	Input.parse_input_event(a)
