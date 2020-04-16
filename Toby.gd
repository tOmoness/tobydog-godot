extends KinematicBody2D

export var SPEED = 150
export var GRAVITY = 20
export var JUMP = 100

var velocity = Vector2()

onready var anim = $AnimationPlayer
onready var sprite = $Sprite

func _physics_process(delta):
	velocity.y += GRAVITY
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		anim.play("Walk")
		sprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		anim.play("Walk")
		sprite.flip_h = false
	else:
		velocity.x = 0
	
	if is_on_floor():
		anim.play("Idle")
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = -JUMP
	
	velocity = move_and_slide(velocity, Vector2(0, -1))
