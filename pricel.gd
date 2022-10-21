extends Sprite

func _ready():
	pass
func _process(delta):
	pass
	global_position = global_position.linear_interpolate(get_global_mouse_position(), 0.25)
