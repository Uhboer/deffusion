extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

const SPEED = 500

@export var bullet : PackedScene


func _physics_process(delta):
	get_input()
	
	
	move_and_slide()


func get_input():
	
	var direction = Input.get_vector("A", "D", "W", "S")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2(0, 0)
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	look_at(get_global_mouse_position())

func shoot():
	var b = bullet.instantiate()
	add_child(b)
	b.transform = $Node/Marker2D.global_transform
