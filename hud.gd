extends Node2D

var bar_red = preload("res://sprites/Player/UI/hpbar.png")
var bar_green = preload("res://sprites/Player/UI/hpbarmax.png")


@onready var healthbar = $HP

@onready var player = $".."

@onready var wearpon = $"../Marker2D"

func _ready():
	pass
func _process(delta):
	$HP.value = player.health
	if player.health >= 50:
		healthbar.texture_progress = bar_green
	if player.health < 50:
		healthbar.texture_progress = bar_red
	
	$AKammo.text = str(wearpon.AKmagaz, "/", wearpon.AKall)
	
