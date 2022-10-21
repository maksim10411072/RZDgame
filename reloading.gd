extends Sprite

func _process(delta):
	if get_node("../../").get_node("rotation point/Pistoletigroka/explosion point"):
		scale.y = inverse_lerp(0, get_node("../../").get_node("rotation point/Pistoletigroka/explosion point").originaltimer, get_node("../../").get_node("rotation point/Pistoletigroka/explosion point").timer) * 4
	else:
		scale.y = 0
