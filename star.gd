extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event.is_action_pressed("jump") :
		print("jumping")
		apply_impulse(Vector2.UP * 500.0)
	
	if event.is_action_pressed("left") :
		print("movign")
		var tween = create_tween().set_parallel(true)
		
		tween.tween_property($Box,"scale",$Box.scale * 2,.02)
		tween.tween_property($CollisionPolygon2D,"scale",$CollisionPolygon2D.scale * 2,.02)
		

	if event.is_action_pressed("right") :
		var tween = create_tween().set_parallel(true)
		tween.tween_property($Box,"scale",$Box.scale / 2,.02)
		tween.tween_property($CollisionPolygon2D,"scale",$CollisionPolygon2D.scale /2,.02)

	
		
func increase_size():
	var tween = create_tween().set_parallel(true)
	tween.tween_property($Box,"scale",$Box.scale * 2,.02)
	tween.tween_property($CollisionPolygon2D,"scale",$CollisionPolygon2D.scale * 2,.02)

func decrease_size():
	var tween = create_tween().set_parallel(true)
	tween.tween_property($Box,"scale",$Box.scale / 2,.02)
	tween.tween_property($CollisionPolygon2D,"scale",$CollisionPolygon2D.scale /2,.02)
