extends Label
var seconds = 0
func _process(delta):
	if !get_node("../../../igrok").isdead:
		text = var2str(seconds) + " Секунд вы живы!"
	else:
		text = var2str(seconds) + " Секунд вы прожили!"
func _on_Timer_timeout():
	if !get_node("../../../igrok").isdead:
		seconds += 0.1
