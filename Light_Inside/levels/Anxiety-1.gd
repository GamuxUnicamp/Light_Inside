extends Node2D

onready var key_count = 0
#nodes
onready var key_label = $CanvasLayer/LabelKeys
onready var key1 = $Keys/Key1
onready var key2 = $Keys/Key2
onready var key3 = $Keys/Key3
onready var door = $Door
onready var door_sound = $DoorSoundOpen
onready var coin_sound = $CoinSound
onready var canvas_layer = $CanvasLayer

func _ready():
	update_key_label()
	key1.connect("body_entered", self, "_on_key_body_enter",[key1])
	key2.connect("body_entered", self, "_on_key_body_enter",[key2])
	key3.connect("body_entered", self, "_on_key_body_enter",[key3])
	door.connect("body_entered", self, "_on_door_body_enter")
	#mobile
	if Global.is_mobile():
		var mobile_buttons = load("res://mobile/MobileButtons1.tscn").instance()
		canvas_layer.add_child(mobile_buttons)

func _on_key_body_enter(body,args):
	if body.is_in_group("player"):
		key_count += 1
		coin_sound.play()
		args.queue_free()
		update_key_label()
		if key_count >= 2:
			$CanvasLayer/Eye.visible = true  

func _on_door_body_enter(body):
	if key_count >= 3:
		door_sound.play()
		OS.delay_msec(700)
		get_tree().change_scene("res://levels/Anxiety-2.tscn")

func update_key_label():
	key_label.text = str(key_count)+"/3"
