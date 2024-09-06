extends Node2D

@export var AKbullet : PackedScene
@export var SHOOTGUNbullet : PackedScene

@onready var character = $".."
@onready var anim = $wearpon

var shooted = false
var AK = true
var shootgun = false

func _process(delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("1"):
		anim.play("AK")
		shootgun = false
		AK = true

	if Input.is_action_just_pressed("2"):
		anim.play("Shootgun")
		shootgun = true
		AK = false
	
	
	
	if Input.is_action_just_pressed("shoot") and shootgun == true:
		shoot()
		
	if Input.is_action_just_pressed("shoot") and AK == true:
		shootAK()
	

func shoot():
	if shooted == false:
		shooted = true
		var b = SHOOTGUNbullet.instantiate()
		add_child(b)
		b.transform = $Node/Marker2D.global_transform
		anim.play("ShootgunPump")
		await get_tree().create_timer(1).timeout
		shooted = false

func shootAK():
	if shooted == false:
		var b = AKbullet.instantiate()
		add_child(b)
		b.transform = $Node/Marker2D.global_transform
		anim.play("AK")
