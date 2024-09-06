extends CharacterBody2D
class_name Zombie
@onready var anim = $AnimatedSprite2D
@onready var attack_zone = $attackZone/CollisionShape2D
const SPEED = 200.0
var alive = true
var health = 40
var damage = 10
var chase = false
var attack = true

func _physics_process(delta: float) -> void:
	if not alive:
		return
	var player = $"../../player"
	if player:
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
	death()
	move_and_slide()
func death():
	if health <= 0: 
		#TODO ебануть анимацию
		# await anim.animation_finis
		alive = false
		queue_free() #затычка

func _on_detect_zone_body_entered(body: Node2D) -> void:
	if body.name == "player":
		chase = true

func _on_attack_zone_body_entered(body: Node2D) -> void:
	if body.name == "player":
		while is_instance_valid(body) and body.alive:
			attack = true
			body.health -= damage
			attack_zone.disabled = true 
			await get_tree().create_timer(1).timeout
			attack_zone.disabled = false
			if attack == false:
				break

func _on_attack_zone_body_exited(body: Node2D) -> void:
	if body.name == "player":
		attack = false
