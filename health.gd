extends Sprite

var permhealth = 4

func _process(delta):
	permhealth = inverse_lerp(0, 100, get_node("../../").health) * 4
	scale.y = lerp(scale.y, permhealth, 0.1)
