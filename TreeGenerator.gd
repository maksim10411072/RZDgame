extends Node2D
var Treee = preload("res://Tree.tscn")
var Treee2 = preload("res://Tree2.tscn")
export var TimerI = 100
export var TimerITREE = 500
export var SpeedTREE = Vector2(-1000, 0)
var TimerA = TimerI
var random = RandomNumberGenerator.new()
func _init():
	random.randomize()
func _physics_process(delta):
	#print(TimerA)
	TimerA -= 1
	if TimerA <= 0:
		if random.randi_range(0, 2) > 0:
			var tree = Treee.instance()
			get_parent().add_child(tree)
			tree.transform = self.transform
			tree.z_index = z_index
			tree.TimerI = TimerITREE
			tree.Motion = SpeedTREE
		else:
			var tree = Treee2.instance()
			get_parent().add_child(tree)
			tree.transform = self.transform
			tree.z_index = z_index
			tree.TimerI = TimerITREE
			tree.Motion = SpeedTREE
		TimerA = TimerI
