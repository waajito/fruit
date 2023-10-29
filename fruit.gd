extends RigidBody2D

@export var idx : int = 0

@onready var age  = Time.get_unix_time_from_system()

signal on_merge

#loading in items as images
var images = [preload("res://sprites/faces/face_blowing_a_kiss_3d.png"), preload("res://sprites/faces/face_exhaling_3d.png"), preload("res://sprites/faces/face_holding_back_tears_3d.png"), preload("res://sprites/faces/face_savoring_food_3d.png"), preload("res://sprites/faces/face_without_mouth_3d.png"), preload("res://sprites/faces/face_with_head-bandage_3d.png"), preload("res://sprites/faces/face_with_medical_mask_3d.png"), preload("res://sprites/faces/face_with_monocle_3d.png"), preload("res://sprites/faces/face_with_rolling_eyes_3d.png"), preload("res://sprites/faces/face_with_symbols_on_mouth_3d.png"), preload("res://sprites/faces/face_with_thermometer_3d.png"), preload("res://sprites/faces/full_moon_3d.png"), preload("res://sprites/faces/grinning_squinting_face_3d.png")]


func _ready():
	
	#setting image based on the idx. which is randomized by spawner
	%fruit_sprite.texture = images[idx]
	tween_item()
	
	
func tween_item():
	#create  a tweener for smoothing out animations
	var tween = create_tween()
	
	#on spawn increasing item size
	tween.tween_property(%fruit_sprite,"scale",Vector2(((idx + 1) * 0.45),((idx + 1) * 0.45)),0.05)
	#increasing collider size
	tween.tween_property(%fruit_collider,"shape:radius",((idx + 1) * 50.0),0.005)
	#increasing blast radius trigger size
	%Area2D/fruit_trigger.shape.radius = (((idx + 1) * 50.0) + (((idx + 1) * 50.0) /7))
	#increasing item mass
	mass = (idx + 1.0)/8.0
	
	

func get_idx():
	return idx

func _on_body_entered(body):
	#checking for the menthod to confirm if this object has fruit.gd script
	if body.has_method("merge"):
		#comparing this.idx to collided.body.idx
		merge_and_delete(body)
		
		
				

func merge():
	#emitting this for the explosion to be triggered
	on_merge.emit()
	#adding idx to evolve the item
	idx = idx+1
	var sprite = %fruit_sprite as Sprite2D
	%fruit_sprite.scale = %fruit_sprite.scale/2
	%fruit_sprite.texture = preload("res://sprites/ex.png")
	await get_tree().create_timer(0.1).timeout
	%fruit_sprite.scale = %fruit_sprite.scale * 2
	
	%fruit_sprite.texture = images[idx]
	var tween = create_tween()
	tween.tween_property(sprite,"scale",Vector2(((idx + 1) * 0.45),((idx + 1) * 0.45)),0.02)
	tween.tween_property(%fruit_collider,"shape:radius",((idx + 1) * 50.0),0.02)

	%Area2D/fruit_trigger.shape.radius = (((idx + 1) * 50.0) + (((idx + 1) * 50.0) /7))
	
	mass = (idx + 1.0)/8.0
	
	for o in get_colliding_bodies():
		if o.has_method("merge"):
			merge_and_delete(o)
			
	
func merge_and_delete(node):
	if idx == node.idx:
		if age > node.age :
			#node2..merge()
			#queue_free()
			merge()
			node.queue_free()
	
