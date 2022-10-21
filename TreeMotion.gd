extends KinematicBody2D

export var TimerI = 500
var TimerA = TimerI
export var Motion = Vector2(-1000, 0)

func _physics_process(delta):
	TimerA -= 1
	move_and_slide(Motion, Vector2.UP)
	if TimerA <= 0:
		self.queue_free()
