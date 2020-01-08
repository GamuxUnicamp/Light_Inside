extends Control

onready var play_button = $PlayButton
onready var options_button = $OptionsButton
onready var credits_button = $CreditsButton
onready var exit_button = $ExitButton

func _ready():
	Global.OS = OS.get_name() #detectar OS
	exit_button.connect("pressed",self,"sair")

func sair():
	get_tree().quit()