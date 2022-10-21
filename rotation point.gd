extends Node2D


onready var pricel = get_node("../pricel")
var angle = float()
var isscale = scale
var realscale = Vector2()
# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(pricel.global_position)
	angle = rad2deg(transform.get_rotation())
	#print(angle)
	if angle < -90:
		realscale = Vector2(1, -1)
	elif angle > 90:
		realscale = Vector2(1, -1)
	else:
		realscale = Vector2(1, 01)
	isscale = isscale.linear_interpolate(realscale, 0.1)
	scale = isscale
	
	
