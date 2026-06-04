extends CharacterBody2D
class_name BOSS

@export var speed = 30
@export var limit = 0.5
@export var endPoint: Marker2D 
@export var damage: int = 10

@onready var animations = $AnimatedSprite2D
@onready var damage_time: Timer = $DamageTime
@onready var player: Player = $"../Player"

var chase: bool = false
var startPos
var endPos
var player_status = null

func _ready():
	startPos = position
	endPos = player.global_position
	


func _process(_delta: float) -> void:
	endPos = player.global_position

func _physics_process(_delta):
	if not chase:
		move_and_slide()
		updateVelocity()
		updateAnim()
	elif chase:
		position += (player.position - position) / speed


func changeDirection():
	var tempEnd = endPos
	endPos = startPos
	startPos = tempEnd


func updateVelocity():
	var moveDirection = endPos - position
	if moveDirection.length() < limit:
		changeDirection()
		
	velocity = moveDirection.normalized()*speed


func updateAnim():
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else:
		var direction = "down"
		if velocity.x < -1: direction = "left"
		elif velocity.x > 1: direction = "right"
		elif velocity.y < 0: direction = "up"
		
		animations.play("walk " + direction)


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player:
		damage_player(body)


func _on_spot_body_entered(body: Node2D) -> void:
	if body is Player:
		chase = true
		player_status = body
		$Spot/detection.shape.radius = 85.0


func _on_spot_body_exited(body: Node2D) -> void:
	if body is Player:
		chase = false
		player_status = null
		$Spot/detection.shape.radius = 30.0


func damage_player(target: Player):
	if damage_time.is_stopped():
		target.currentHealth -= damage
		damage_time.start()
	else: 
		await damage_time.timeout
		damage_player(target)
