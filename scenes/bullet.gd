extends Area2D

var speed = 20

func _physics_process(delta):
	position += transform.x * speed

func _on_body_entered(body: Node2D):
	if body.get_parent().name == "Mobs":
		body.health -= 10
		queue_free()
	else:
		queue_free()
