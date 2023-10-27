extends RigidBody2D

var hit_force : float = 50.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) :
		var dir = global_position.direction_to(get_global_mouse_position())
		apply_impulse(dir * hit_force)
