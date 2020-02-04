extends Control

onready var tut_button = $TutorialButton
onready var anx_button = $AnxietyButton
onready var dep_button = $DepressionButton
onready var ang_button = $AngerButton
onready var ext_button = $ExtraButton

func _ready():
	tut_button.connect("button_down", self, "_level_select_button_down",[0])
	anx_button.connect("button_down", self, "_level_select_button_down",[1])
	dep_button.connect("button_down", self, "_level_select_button_down",[2])
	ang_button.connect("button_down", self, "_level_select_button_down",[3])
	ext_button.connect("button_down", self, "_level_select_button_down",[4])

func _level_select_button_down(btn):
	match btn:
		0:
			get_tree().change_scene("res://levels/Tutorial-1.tscn")
		1:
			get_tree().change_scene("res://levels/Anxiety-1.tscn")
		2:
			print("depression")
		3:
			get_tree().change_scene("res://levels/Anger-1.tscn")
		4:
			get_tree().change_scene("res://levels/Anxiety-0.tscn")
