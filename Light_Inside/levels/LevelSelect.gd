extends Control

onready var anx_button = $AnxietyButton
onready var dep_button = $DepressionButton
onready var ang_button = $AngerButton

func _ready():
	anx_button.connect("button_down", self, "_level_select_button_down",[0])
	dep_button.connect("button_down", self, "_level_select_button_down",[1])
	ang_button.connect("button_down", self, "_level_select_button_down",[2])

func _level_select_button_down(btn):
	match btn:
		0:
			get_tree().change_scene("res://levels/Anxiety-1.tscn")
		1:
			print("dep")
		2:
			print("ang")
