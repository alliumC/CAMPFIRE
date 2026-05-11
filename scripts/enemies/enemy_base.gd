extends CharacterBody2D
class_name enemy

@export var speed = 30
@export var limit = 0.5
@export var endPoint: Marker2D 
@export var damage: int = 10

@onready var animations = $AnimatedSprite2D
@onready var damage_time: Timer = $DamageTime

var startPos
var endPos

func _ready():
	startPos = position
	endPos = endPoint.global_position

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


func _physics_process(_delta):
	updateVelocity()
	move_and_slide()
	updateAnim()
	

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player:
		damage_player(body)

func damage_player(player):
	if damage_time.is_stopped():
		player.currentHealth -= damage
		damage_time.start()
	else: 
		await damage_time.timeout
		damage_player(player)
