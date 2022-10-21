extends KinematicBody2D

export var speed = 40
export (Vector2) var gravity = Vector2(0, -10)
export var jump = -250
export (Vector2)  var velocity = Vector2()
onready var food = get_node("../igrok")
var isdead = false
func _ready():
	pass
#мозги мозги
func _physics_process(delta):
	#print("мозги мозги.")
	
	if food.position.x < position.x and !isdead and !food.isdead:
		velocity.x += lerp(velocity.x, -speed, 0.9)
	if food.position.x > position.x and !isdead and !food.isdead:
		velocity.x -= lerp(velocity.x, -speed, 0.9)
	velocity.x = clamp(velocity.x, -100, 100)
	if isdead:
		scale = scale.linear_interpolate(Vector2(1,0), 0.1)
		if scale == Vector2(1,0):
			queue_free()
	if food.isdead:
		velocity.x = 0
	if !isdead:
		velocity = move_and_slide(velocity - gravity, Vector2.UP, false, 4, 0.785398, false)
	if !get_node("prizhok").is_colliding():
		if is_on_floor():
			velocity.y = jump
		if is_on_wall():
			velocity.y = jump
	if food.position.y < (position.y - 10) and !food.isdead:
		if is_on_floor():
			velocity.y = jump
		if is_on_wall():
			velocity.y = jump
func _food_is_here(body):
	#print(body)
	body.queue_free()
	get_node("CollisionShape2D").queue_free()
	get_node("Area2D").queue_free()
	get_node("damag po igroku").queue_free()
	isdead = true
	#get_node("AudioStreamPlayer2D").play()
