extends Node

onready var exit_button = $ExitButton

func _ready():
	exit_button.connect("pressed",self,"sair")

func sair():
	get_tree().change_scene("res://main_menu/MainMenu.tscn")