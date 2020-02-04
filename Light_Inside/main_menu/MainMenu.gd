extends Control

onready var play_button = $PlayButton
onready var options_button = $OptionsButton
onready var credits_button = $CreditsButton
onready var exit_button = $ExitButton

func _ready():
	Global.vos = OS.get_name() #detectar OS
	play_button.connect("pressed", self, "jogar")
	options_button.connect("pressed",self,"opcoes")
	credits_button.connect("pressed",self,"creditos")
	exit_button.connect("pressed",self,"sair")

func jogar():
	get_tree().change_scene("res://main_menu/LevelSelect.tscn")

func opcoes():
	get_tree().change_scene("res://main_menu/Opcoes.tscn")

func creditos():
	get_tree().change_scene("res://main_menu/Creditos.tscn")

func sair():
	get_tree().quit()
