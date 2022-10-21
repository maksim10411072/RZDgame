extends Camera2D
var scrollreal = Vector2(1,1)
var scrolltemp = Vector2(1,1)

func _ready():
	pass

func process():
	if Input.is_action_just_released("mouse_scroll_up"):
		scrolltemp += Vector2(-0.1,-0.1)
	if Input.is_action_just_released("mouse_scroll_down"):
		scrolltemp += Vector2(0.1,0.1)
	scrolltemp.x = clamp(scrolltemp.x, 0.1, 1)
	scrolltemp.y = clamp(scrolltemp.y, 0.1, 1)
	scrollreal = scrollreal.linear_interpolate(scrolltemp, 0.1)
	#print(scrollreal)
	#print(scrolltemp)
	zoom = scrollreal
