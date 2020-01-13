extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 5000
const JUMP = 2000
const WALK = 400
var velocity = Vector2(0,0)
onready var sprite = $Sprite

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += delta * GRAVITY
	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK
		sprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		velocity.x = WALK
		sprite.flip_h = false
	else:
		velocity.x = 0
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = -JUMP
		#play jump sound
	elif Input.is_action_just_pressed("ui_down"):
		velocity.y = WALK
	if is_on_ceiling():
		velocity.y = WALK
	move_and_slide(velocity,UP)
	#Collisions
	for i in get_slide_count():
		var collider = get_slide_collision(i).collider
		if collider.is_in_group("key"):
			print("KEY")
			collider.queue_free()
