extends Position2D

export (PackedScene) var Bullet
var timer = 0.0
export var originaltimer = 1.0
func _process(delta):
	pass
#	if timer > 0:
#		timer = originaltimer
	if Input.is_action_pressed("mouse_left_click") and timer <= 0:
		var bullettemp = Bullet.instance()
		get_node("/root/").add_child(bullettemp)
		bullettemp.position = self.global_position
		bullettemp.rotation = self.global_rotation + rand_range(-0.01, 0.01)
		timer = originaltimer
		get_node("AudioStreamPlayer2D").play()
	timer -= delta
	timer = clamp(timer, 0, originaltimer)

