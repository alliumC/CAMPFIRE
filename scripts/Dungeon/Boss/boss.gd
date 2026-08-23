extends CharacterBody2D
class_name BOSS
@export var player : Player

@export var speed: float = 20
@export var damage: int = 10

@onready var animations = $AnimatedSprite2D
@onready var damage_time: Timer = $DamageTime
@onready var hp_barr: TextureProgressBar = $"../CanvasLayer/HPBarr"
@onready var attack_timer: Timer = $AttackTimer

const FIREBALL = preload("uid://bm1v8065l461v")

var maxHealth : float = 200
var health : float = maxHealth

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)

	velocity = direction * speed

	move_and_slide()
	updateAnim()
	
func _process(_delta: float) -> void:
	hp_barr.value = health
	
	if health <= 0:
		self.queue_free()
		var tween = create_tween()
		tween.tween_property(Music.boss, "volume_db", -80, 0.75)
		Music.boss.stop()
		SceneLoader.load_scene("uid://qswdei13wm0i", 1)


func updateAnim():
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else:
		var direction = "down"

		if velocity.x < -1:
			direction = "left"
		elif velocity.x > 1:
			direction = "right"
		elif velocity.y < 0:
			direction = "up"
		
		animations.play("walk " + direction)
		
	if health <= 0:
		animations.play("death")


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player:
		set_physics_process(false)
		speed = 0
		animations.stop()

func _on_hitbox_body_exited(body: Node2D) -> void:
	if body is Player:
		set_physics_process(true)
		speed = 20


func _on_attack_timer_timeout() -> void:
	var fball = FIREBALL.instantiate()
	fball.playerpos = player.global_position
	add_child(fball)
	fball.visible = true
	Sfx.fireball.play()
