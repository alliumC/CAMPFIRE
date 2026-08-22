extends CharacterBody2D
class_name Player

const ATTACK_BOX = preload("uid://djx3aqrh0dlu5")
@onready var inv: VBoxContainer = $PlayerHurtbox/CollisionShape2D/CanvasLayer/VBoxContainer

@export var maxHealth: int = 100
@export var speed:float =200
@onready var sprite=$AnimatedSprite2D
@onready var hp_barr: TextureProgressBar = $PlayerHurtbox/CollisionShape2D/CanvasLayer/HPBarr
@onready var heal_cooldown: Timer = $HealCool

@onready var cool_down: Timer = $CoolDown
@onready var heal_cool: Timer = $HealCool
var currentHealth: int = maxHealth
var lastDirection: String = "down"
var attack = false
var cooldown = false
var cooldown_heal = false

func _ready() -> void:
	hp_barr.max_value = maxHealth
	hp_barr.value = maxHealth
	$PlayerHurtbox/CollisionShape2D/CanvasLayer.visible = true

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
		if GlobalScript.item1_equipped:
			if cooldown == false:
				Sfx.sword.play()
				cool_down.start()
				cooldown = true
				attack = true
				var atbox = ATTACK_BOX.instantiate()
				match lastDirection:
					"up":
						atbox.global_position = self.position + Vector2(0, -30)
					"down":
						atbox.global_position = self.position + Vector2(0, 10)
					"right":
						atbox.global_position = self.position + Vector2(15, -10)
					"left":
						atbox.global_position = self.position + Vector2(-15, -10)
				
				get_tree().current_scene.add_child(atbox)
				inv.cooldown(inv.inv_1_cooldown, 0.4)
		elif GlobalScript.item2_equipped:
			if cooldown_heal == false:
				Sfx.potion.play()
				cooldown_heal = true
				heal_cool.start()
				currentHealth += 30
				
				if currentHealth > maxHealth:
					currentHealth = maxHealth
					
				inv.cooldown(inv.inv_2_cooldown, 20)

func _physics_process(_delta):
	if not attack:
		get_player_input()
		move_and_slide()


func _on_cool_down_timeout() -> void:
	cooldown = false
	attack = false


func _on_heal_cool_timeout() -> void:
	cooldown_heal = false
