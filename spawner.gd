extends Position2D
func _process(delta):
	if rand_range(0, 1000) < 2:
		var brainEater = preload("res://zombie.tscn").instance()
		owner.add_child(brainEater)
		brainEater.position = position
