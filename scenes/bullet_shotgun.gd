extends Area2D

var speed = 20
var damage = 10

func _physics_process(delta):
	position += transform.x * speed

func _on_body_entered(body: Node2D):
	if body.get_parent().name == "Mobs":
		if "armor" in body:
			body.health -= (damage - body.armor)
			queue_free()
		else:
			body.health -= damage
			queue_free()
	else:
		queue_free()
