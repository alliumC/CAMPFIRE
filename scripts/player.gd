extends CharacterBody2D

@export var speed:float =100
@onready var sprite=$AnimatedSprite2D
@onready var light = $PointLight2D
var maxHealth=10
var health=maxHealth
var minHealth=0
var lastDirection=0
var enemy
var attack=false
var cooldown=false

func get_player_input() -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	
	if not attack:
		if direction.x != 0 or direction.y != 0:
				if direction.x > direction.y:
					lastDirection="right" if direction.x > 0 else "up"
					sprite.play("walk " +lastDirection)
				else:
					lastDirection="down" if direction.y > 0 else "left"
					sprite.play("walk " +lastDirection)
		else:
			if lastDirection:
				sprite.play("idle "+lastDirection)
			else:
				sprite.play("idle down")	
			
	if Input.is_action_just_pressed("attack"):
			if cooldown==false:
				attack=true
				sprite.play("attack")
				await sprite.animation_finished
				sprite.play("idle")
				attack=false
				cooldown=true
				$attack.start()

func _physics_process(_delta):
	get_player_input()
	move_and_slide()

func _on_animated_sprite_2d_frame_changed():
	if enemy and sprite.animation == "attack" and sprite.frame == 1:
		enemy.takeDamage()

#------

func _on_hit_body_entered(body):
	if body.name == "enemy":
		print("yo")
		enemy=body
		
func _on_hit_body_exited(body):
	if body.name == "enemy":
		print('bye')
		enemy=null

func takeDamage():
	if health > minHealth:
		health -= GlobalVar.damageDealt
		print(health)


func _on_attack_timeout():
	cooldown=false
	
