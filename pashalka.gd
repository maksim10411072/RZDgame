extends ToolButton
const alphafull = Color(0,0,0,1)
const alphanull = Color(0,0,0,0)
var ishovered = false
func _ready():
	pass
func _on_ToolButton_mouse_entered():
	ishovered = true

func _on_ToolButton_mouse_exited():
	ishovered = false
func _process(delta):
	if ishovered:
		self_modulate = lerp(self_modulate, alphafull, 0.05)
	else:
		self_modulate = lerp(self_modulate, alphanull, 0.05)
