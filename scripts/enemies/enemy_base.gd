extends CharacterBody2D

@export var speed: int  = 25
@export var enemy_health: int = 10
@export var damage: int = 5
var player_chase = false
var player = null

func _physics_process(_delta: float) -> void:
	if player_chase:
		position += (player.position - position) / speed


func _on_detection_body_entered(body):
	player = body
	player_chase = true


func _on_detection_body_exited(_body):
	player = null
	player_chase = false
	
