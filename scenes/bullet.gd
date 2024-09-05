extends Area2D

var speed = 20
var damage = 10

func _physics_process(delta):
	position += transform.x * speed

func _on_body_entered(body: Node2D):
	if body.get_parent().name == "Mobs":
		if body.armor == true:
			body.health -= damage - body.armor
			queue_free()
		else:
			body.health -= damage
	else:
		queue_free()
