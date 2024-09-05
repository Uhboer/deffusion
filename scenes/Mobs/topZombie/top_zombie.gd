extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
const SPEED = 200.0
var chase = false
var alive = true
var health = 100.0
var armor = 0.2

func _physics_process(delta: float) -> void:
	var player = $"../../player"
	var direction = (player.position - self.position).normalized()
	
	$Label.text = str(int(health))
	
	if alive == true:
		if direction.x < 0:
			anim.flip_h = true
		else:
			anim.flip_h = false
			
		if chase == true:
			anim.play("Run")
			velocity = direction * SPEED
			
	death()
	move_and_slide()

func death():
	if health <= 0: 
		#TODO ебануть анимацию
		# await anim.animation_finish
		queue_free() #затычка
		alive = false

func _on_detect_zone_body_entered(body: Node2D) -> void:
	if body.name == "player":
		chase = true
