extends Node2D

@export var AKbullet : PackedScene
@export var SHOOTGUNbullet : PackedScene

@onready var character = $".."
@onready var anim = $wearpon

var shooted = false
var AK = true
var shootgun = false

var AKmagaz = 30
var AKall = 100

var shootgunall = 50
var shootgunmagaz = 8

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
	
	
	
	if Input.is_action_just_pressed("shoot") and shootgun == true and shootgunmagaz > 0:
		shoot()
		
	if Input.is_action_pressed("shoot") and AK == true and AKmagaz > 0:
		shootAK()
	
	
	
	AKmagaz = clamp(AKmagaz, 0, 30)
	AKall = clamp(AKall,0, 999999999999)
	shootgunmagaz = clamp(shootgunmagaz, 0, 8)
	shootgunall = clamp(shootgunall,0, 999999999999)
	if Input.is_action_just_pressed("R") and AK == true:
		if AKall >= 30 and AKmagaz < 30 and AKall != 0:
			var AKrezerv = 30 - AKmagaz
			AKall -= AKrezerv
			AKmagaz += AKrezerv
		elif AKall > 0:
			var AKrezerv = AKall
			AKmagaz += AKrezerv
			AKall -= AKrezerv

	if Input.is_action_just_pressed("R") and shootgun == true:
		if shootgunall >= 8 and shootgunmagaz < 8 and shootgunall != 0:
			var shootgunrezerv = 8 - shootgunmagaz
			shootgunall -= shootgunrezerv
			shootgunmagaz += shootgunrezerv
		elif shootgunall > 0:
			var shootgunrezerv = shootgunall
			shootgunmagaz += shootgunrezerv
			shootgunall -= shootgunrezerv


func shoot():
	if shooted == false:
		shooted = true
		shootgunmagaz -= 1
		var b = SHOOTGUNbullet.instantiate()
		add_child(b)
		b.transform = $Node/Marker2D.global_transform
		anim.play("ShootgunPump")
		await get_tree().create_timer(1).timeout
		shooted = false

func shootAK():
	if shooted == false:
		shooted = true
		AKmagaz -= 1
		var b = AKbullet.instantiate()
		add_child(b)
		b.transform = $Node/Marker2D.global_transform
		anim.play("AKShoot")
		await get_tree().create_timer(0.2).timeout
		shooted = false
