extends Node2D

@onready var zombie = preload("res://scenes/Mobs/zombie/zombie.tscn")
@onready var topZombie = preload("res://scenes/Mobs/topZombie/topZombie.tscn")

func _on_timer_timeout() -> void:
	var zomb = null
	var random_chance = randi() % 100

	if random_chance < 20:
		zomb = topZombie.instantiate()
	else:
		zomb = zombie.instantiate()

	zomb.position = Vector2(randf_range(-100, 100), randf_range(-100, 100))
	get_parent().get_node("Mobs").add_child(zomb)
