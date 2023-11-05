extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#%GameOverLine.add_point(Vector2(-get_viewport_rect().size.x*1.65,0),0)
	#%GameOverLine.add_point(Vector2(get_viewport_rect().size.x*1.65 ,0),1)
	pass

func _draw() -> void:
	draw_dashed_line(Vector2.ZERO, Vector2.RIGHT * 300, Color.RED,10.0,2.0)
