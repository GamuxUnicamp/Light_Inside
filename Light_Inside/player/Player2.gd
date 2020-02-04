extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 5000
const JUMP = 1800
const WALK = 450
var velocity = Vector2(0,0)
onready var sprite = $Sprite
onready var animation = $Sprite/AnimationPlayer
onready var jump_sound = $JumpSound

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += delta * GRAVITY
		animation.play("jump")
	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK
		sprite.flip_h = true
		if is_on_floor():
			animation.play("walk")
	elif Input.is_action_pressed("ui_right"):
		velocity.x = WALK
		sprite.flip_h = false
		if is_on_floor():
			animation.play("walk")
	else:
		velocity.x = 0
		if is_on_floor():
			animation.play("default")
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = -JUMP
		jump_sound.play()
	elif Input.is_action_just_pressed("ui_down"):
		velocity.y = WALK
	if is_on_ceiling():
		velocity.y = WALK
	move_and_slide(velocity,UP)
	#Collisions
	for i in get_slide_count():
		var collider = get_slide_collision(i).collider
		pass
