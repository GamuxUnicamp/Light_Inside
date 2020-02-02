extends Node2D

func _ready():
	Input.vibrate_handheld(2000)
	Input.start_joy_vibration(0,1,1,2000)
	$Timer.connect("timeout", self, "next_level")

func next_level():
	get_tree().change_scene("res://levels/Anxiety-1.tscn")
