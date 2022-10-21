extends Area2D


func _on_Area2D_body_entered(body):
	if body.name == "igrok":
		body.isreturning = true
		body.health -= 10
	if body.name == "zombie":
		body.isdead = true
