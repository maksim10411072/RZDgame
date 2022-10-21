extends Node2D
func _ready():
	OS.set_window_size(OS.get_screen_size())
	#OS.set_window_position(Vector2(0, 0))
	OS.set_window_maximized(true)

func _process(delta):
	pass
	get_node("igrok/maincamera").process()
	if Input.is_action_just_pressed("ui_cancel"):
		queue_free()
		get_tree().change_scene("res://Main Menu.tscn")
	if Input.is_action_just_pressed("f11"):
		OS.window_fullscreen = !OS.window_fullscreen
