extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

const SPEED = 500

@export var bullet : PackedScene

var health = 100

func _physics_process(delta):
	get_input()

	move_and_slide()


func get_input():
	var direction = Input.get_vector("A", "D", "W", "S")
	if direction:
		anim.play("Run")
		velocity = direction * SPEED
	else:
		velocity = Vector2(0, 0)
		anim.play("Idle")
	if Input.is_action_just_pressed("A"):
		$AnimatedSprite2D.flip_h = true
	if Input.is_action_just_pressed("D"):
		$AnimatedSprite2D.flip_h = false
	
	if health <= 0:
		queue_free()
