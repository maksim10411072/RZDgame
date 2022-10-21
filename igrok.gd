extends KinematicBody2D

export var speed = 40
export (Vector2) var gravity = Vector2(0, -10)
export var jump = -250
export (Vector2)  var velocity = Vector2()
var health = 100
var isdead = false
var issliding = false
var isreturning = false
var initialposition = position
func _ready():
	pass
#не обязан
func _physics_process(delta):
	#print("Не обязан.")
	#pass
	#print(delta)
	#var velocity = Vector2()
	if Input.is_action_pressed("ui_right") and !isdead and !issliding:
		velocity.x += speed
	if Input.is_action_pressed("ui_left") and !isdead and !issliding:
		velocity.x -= speed
	if Input.is_action_pressed("ui_down") and get_node("raycastplayer").is_colliding() and !isdead:
		velocity.y = 1000
	if Input.is_action_pressed("ui_up") and !isdead:
		if is_on_floor():
			velocity.y = jump
		if is_on_wall():
			velocity.y = jump
			pass
	if Input.is_action_pressed("shift") and Input.is_action_pressed("ui_right"):
		if !issliding:
			velocity.x = 1000
		issliding = true
	if Input.is_action_pressed("shift") and Input.is_action_pressed("ui_left"):
		if !issliding:
			velocity.x = -1000
		issliding = true
	if !Input.is_action_pressed("shift"):
		issliding = false
	#if velocity.length() > 0:
	#if is_on_floor():
	#	tempgravity = 0
	#	print("fuck")
	#velocity.x *= speed
	#velocity.y = gravity
	if !issliding:
		velocity.x = clamp(velocity.x, -500, 500)
	if is_on_floor() and !Input.is_action_pressed("ui_right") and !Input.is_action_pressed("ui_left"):
		if !issliding:
			velocity.x = lerp(velocity.x, 0, 0.1)
	if is_on_floor() and issliding:
		velocity.x = lerp(velocity.x, 0, 0.01)
	if issliding:
		scale = scale.linear_interpolate(Vector2(1,0.5), 0.1)
		get_node("raycastplayer").scale.y = 1.5
	if !issliding:
		scale = scale.linear_interpolate(Vector2(1,1), 0.1)
		get_node("raycastplayer").scale.y = 1
	if health <= 0 and !isdead:
		if get_node("Area2D"):
			get_node("Area2D").queue_free()
		if get_node("Area2D/CollisionShape2D"):
			get_node("CollisionShape2D").queue_free()
		if get_node("rotation point"):
			get_node("rotation point").queue_free()
		isdead = true
	if isdead:
		get_node("igrok").modulate = get_node("igrok").modulate.linear_interpolate(Color8(79, 123, 57, 255), 0.01)
		velocity.y = -100
		velocity.x *= 0.89
		velocity = move_and_slide(velocity, Vector2.UP, false, 4, 0.785398, false)
	
	#print(velocity)
	#print(velocity)
	#print(position - initialposition)
	if !isdead and !isreturning:
		velocity = move_and_slide(velocity - gravity, Vector2.UP, false, 4, 0.785398, false)
	if isreturning:
		position = lerp(position, initialposition, 0.1)
		var raznost = position - initialposition
		if raznost < Vector2(1,1) and raznost > Vector2(-1,-1):
			velocity = Vector2.ZERO
			isreturning = false


func _damag_po_igroku(area):
	health -= 25
	
