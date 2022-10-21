extends KinematicBody2D
export var speed = Vector2(20,0)
var timer = 0.0
export var originaltimer = 10.0
func _ready():
	timer = originaltimer 
func _physics_process(delta):
	pass
	position = move_and_slide(position + speed.rotated(rotation), Vector2.UP, false, 4, 0.785398, false)
	#print(timer)
	if timer <= 0:
		queue_free()
	else:
		timer -= delta
	if is_on_ceiling() or is_on_floor() or is_on_wall():
		queue_free()
