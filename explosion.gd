extends Area2D


func explosion():
	for o in get_overlapping_bodies():
		if o is RigidBody2D:
			var force = (o.global_position - global_position).normalized()
			force *= 8000
			o.apply_central_impulse(force)


func _on_fruit_test():
	print("explosion")
	explosion()


