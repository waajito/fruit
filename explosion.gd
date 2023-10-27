extends Area2D

func _on_merge_explosion():
	for o in get_overlapping_bodies():
		if o is RigidBody2D:
			var force = (o.global_position - global_position).normalized()
			force *= 500
			o.apply_central_impulse(force)
