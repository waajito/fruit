extends Control
var images = [preload("res://sprites/faces/face_blowing_a_kiss_3d.png"), preload("res://sprites/faces/face_exhaling_3d.png"), preload("res://sprites/faces/face_holding_back_tears_3d.png"), preload("res://sprites/faces/face_savoring_food_3d.png"), preload("res://sprites/faces/face_without_mouth_3d.png"), preload("res://sprites/faces/face_with_head-bandage_3d.png"), preload("res://sprites/faces/face_with_medical_mask_3d.png"), preload("res://sprites/faces/face_with_monocle_3d.png"), preload("res://sprites/faces/face_with_rolling_eyes_3d.png"), preload("res://sprites/faces/face_with_symbols_on_mouth_3d.png"), preload("res://sprites/faces/face_with_thermometer_3d.png"), preload("res://sprites/faces/full_moon_3d.png"), preload("res://sprites/faces/grinning_squinting_face_3d.png")]
func ChangeIcon(texture) :
	var tween = create_tween()
	
	tween.tween_property(%Panel/next_fruit,"scale",Vector2(1.0,1.0),0.3).from(Vector2(.9,.9))
	%Panel/next_fruit.texture = texture


func _on_spawn(idx):
	ChangeIcon(images[idx])


