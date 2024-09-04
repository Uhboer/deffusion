extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
const SPEED = 200.0
var chase = false
var alive = true
var health = 100

func _physics_process(delta: float) -> void:
	var player = $"../../player"
	var direction = (player.position - self.position).normalized()
	
	$Label.text = str(health)
	
	if alive == true:
		if direction.x < 0:
			anim.flip_h = true
		else:
			anim.flip_h = false
			
		if chase == true:
			anim.play("Run")
			velocity = direction * SPEED
	move_and_slide()

func _on_detect_zone_body_entered(body: Node2D) -> void:
	if body.name == "player":
		chase = true
