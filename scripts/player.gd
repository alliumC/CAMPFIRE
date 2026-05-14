extends CharacterBody2D
class_name Player


@export var maxHealth: int = 100
@export var speed:float =200
@onready var sprite=$AnimatedSprite2D
@onready var hp_barr: TextureProgressBar = $CanvasLayer/HPBarr
@onready var heal_cooldown: Timer = $HealCool


var currentHealth: int = maxHealth
var lastDirection=0
var attack=false
var cooldown=false


func _ready() -> void:
	hp_barr.max_value = maxHealth
	hp_barr.value = maxHealth

func _process(_delta: float) -> void:
	hp_barr.value = currentHealth
	if currentHealth == 0 or currentHealth < 0:
		get_tree().reload_current_scene()
	elif currentHealth != maxHealth and heal_cooldown.is_stopped():
		currentHealth += 1	
		heal_cooldown.start()

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
