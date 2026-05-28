extends Sprite2D

@export var damage: int = 10
@export var player_pos: Vector2

@onready var player: Player = $"../../Player"
@onready var timer: Timer = $"../Timer"


var attack = false

func _process(_delta) -> void:
	if timer.is_stopped():
		get_player_pos()
		timer.start()
		look_at(player_pos)
		rotation_degrees += 90 


func get_player_pos():
	player_pos = player.global_position
	print(player_pos)
