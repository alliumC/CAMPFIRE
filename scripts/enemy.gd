extends CharacterBody2D

var speed = 70
var player = null
var maxHealth = 10
var health = maxHealth
var minHealth=0
var damage_dealt = 0
var attackPlayer = null
var direction 
enum state {PATROL, CHASE, RETURN}
var currentState = state.PATROL
@onready var pathFollow =$"../PathFollow2D"
@onready var enemySprite = $AnimatedSprite2D
@onready var navAgent = $nav/NavigationAgent2D
var distance = 0
var homePos=global_position

func _physics_process(delta):
	GlobalVar.damageDealt = damage_dealt
	match currentState:
		state.PATROL:
			pathFollow.progress += speed * delta
			global_position = pathFollow.global_position
			direction = (global_position - homePos).normalized()
			homePos=global_position
			if player:
				currentState = state.CHASE
		state.CHASE:
			if player:
				direction = (player.global_position - global_position).normalized()
				distance = global_position.distance_to(player.global_position)
			if not player:
				currentState = state.RETURN
				
		state.RETURN:
			navAgent.target_position = homePos
			direction = (homePos - global_position).normalized()
			velocity = global_position.direction_to(navAgent.get_next_path_position()) * speed
				
			if global_position.distance_to(homePos) < 1:
				currentState = state.PATROL
			if player:
				currentState = state.CHASE
			move_and_slide()

	if direction.x> 0:
		enemySprite.flip_h=true
	else:
		enemySprite.flip_h=false
	
	if currentState == state.PATROL or distance>10:
		velocity=direction*speed
		if not attackPlayer and enemySprite.animation != "attack":
			enemySprite.play("walk")
	elif distance<10:
		if not attackPlayer and enemySprite.animation != "attack":
			velocity = Vector2.ZERO
			enemySprite.play("idle")
	move_and_slide()


func _on_detection_body_entered(body):
	if body.name == "player":
		player = body

func _on_detection_body_exited(body):
	if body.name == "player":
		player = null

func _on_aggro_body_entered(body):
	if body.name=="player":
		attackPlayer=body
		if self.name == "enemy":
			damage_dealt=1
			attack()
			velocity = Vector2.ZERO
			$"aggro/hit cooldown".start()


func _on_aggro_body_exited(body):
	if body.name == "player":
		attackPlayer = null
		$"aggro/hit cooldown".stop()

func attack():
	velocity = Vector2.ZERO
	enemySprite.play("attack")
	await enemySprite.animation_finished
	enemySprite.play("idle")

func _on_hit_cooldown_timeout():
	if attackPlayer:
		_on_aggro_body_entered(attackPlayer)
	if not player:
		currentState = state.RETURN


func _on_animated_sprite_2d_frame_changed():
	if attackPlayer and enemySprite.animation == "attack" and enemySprite.frame == 4:
		attackPlayer.takeDamage()

func takeDamage():
	if health > minHealth:
		health -= GlobalVar.damageDealt
		print("enemy: " + str(health))
