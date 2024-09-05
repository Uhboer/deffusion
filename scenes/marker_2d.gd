extends Node2D

@export var bullet : PackedScene

@onready var character = $".."
@onready var anim = $wearpon

func _process(delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
		await get_tree().create_timer(2).timeout
	

func shoot():
	var b = bullet.instantiate()
	add_child(b)
	b.transform = $Node/Marker2D.global_transform
	anim.play("ShootgunPump")
