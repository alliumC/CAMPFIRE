extends CharacterBody2D

@export var speed = 130

func get_player_input() -> void:
	var vector := Input.get_vector("left", "right", "up", "down")
	velocity = vector * speed
	move_and_slide()

func _physics_process(_delta):
	get_player_input()
	
