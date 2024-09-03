extends Area2D

var speed = 20

func _physics_process(delta):
	position += transform.x * speed

func _on_area_entered(area):
	if area.get_parent().name == "enemy":
		queue_free()
	else:
		queue_free()
