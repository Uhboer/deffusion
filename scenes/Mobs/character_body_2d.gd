extends CharacterBody2D
@onready var anim = $AnimatedSprite2D

const SPEED = 200.0
var player = null

func _physics_process(delta) -> void:
	if not player: return
	var direction = (player.transform.origin - self.transform.origin).normalized()
	velocity = direction * SPEED
	anim.play("move")
	move_and_slide()

func _on_detection_area_body_entered(body: Node2D) -> void:
	# TODO: check if body is player
	if true:
		player = body



func _on_detection_area_body_exited(body: Node2D) -> void:
	if true:
		player = null
		anim.play("idle")
