extends Node2D

@export var bullet : PackedScene

@onready var character = $".."
@onready var anim = $wearpon

var shooted = false

func _process(delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
	

func shoot():
	if shooted == false:
		shooted = true
		var b = bullet.instantiate()
		add_child(b)
		b.transform = $Node/Marker2D.global_transform
		anim.play("ShootgunPump")
		await get_tree().create_timer(1).timeout
		shooted = false
	
