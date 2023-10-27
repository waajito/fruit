extends RigidBody2D

@export var idx : int = 0

@onready var age  = Time.get_unix_time_from_system()

signal on_merge
var images = [preload("res://sprites/faces/face_blowing_a_kiss_3d.png"), preload("res://sprites/faces/face_holding_back_tears_3d.png"), preload("res://sprites/faces/face_savoring_food_3d.png"), preload("res://sprites/faces/face_without_mouth_3d.png"), preload("res://sprites/faces/face_with_head-bandage_3d.png"), preload("res://sprites/faces/face_with_medical_mask_3d.png"), preload("res://sprites/faces/face_with_rolling_eyes_3d.png"), preload("res://sprites/faces/face_with_symbols_on_mouth_3d.png"), preload("res://sprites/faces/full_moon_3d.png"), preload("res://sprites/faces/grinning_squinting_face_3d.png")]
#var images = [preload("res://sprites/ball 01.svg"), preload("res://sprites/ball 02.svg"), preload("res://sprites/ball 03.svg"), preload("res://sprites/ball 04.svg"), preload("res://sprites/ball 05.svg"), preload("res://sprites/ball 06.svg"), preload("res://sprites/ball 07.svg"), preload("res://sprites/ball 08.svg")]
# Called when the node enters the scene tree for the first time.
func _ready():
	var sprite = %fruit_sprite as Sprite2D
	
	idx = randi() % 3 
	sprite.texture = images[idx]
	var tween = create_tween()
	
	
	tween.tween_property(sprite,"scale",Vector2(((idx + 1) * 0.45),((idx + 1) * 0.45)),0.005)

	tween.tween_property(%fruit_collider,"shape:radius",((idx + 1) * 50.0),0.005)
	
	%Area2D/fruit_trigger.shape.radius = (((idx + 1) * 50.0) + (((idx + 1) * 50.0) /7))
	mass = (idx + 1.0)/8.0
	

func get_idx():
	return idx

func _on_body_entered(body):
	if body.has_method("get_idx"):
		if idx == body.idx:
			if age > body.age :
				body.merge()
				queue_free()
		
				

func merge():
	on_merge.emit()
	idx = idx+1
	var sprite = %fruit_sprite as Sprite2D
	%fruit_sprite.texture = preload("res://sprites/ex.png")
	await get_tree().create_timer(0.1).timeout
	%fruit_sprite.texture = images[idx]
	var tween = create_tween()
	tween.tween_property(sprite,"scale",Vector2(((idx + 1) * 0.45),((idx + 1) * 0.45)),0.01)
	
	tween.tween_property(%fruit_collider,"shape:radius",((idx + 1) * 50.0),0.01)

	%Area2D/fruit_trigger.shape.radius = (((idx + 1) * 50.0) + (((idx + 1) * 50.0) /7))
	
	mass = (idx + 1.0)/8.0
	
	
	
