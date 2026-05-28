extends Area2D

@onready var player: Player = $"../../Player"

var enemy_count: int

func _process(_delta: float) -> void:
	if enemy_count > 0:
		$"../Invis Borders/Up".disabled = false
		$"../Invis Borders/Down".disabled = false
		$"../Invis Borders/Right".disabled = false
		$"../Invis Borders/Left".disabled = false
	else:
		$"../Invis Borders/Up".disabled = true
		$"../Invis Borders/Down".disabled = true
		$"../Invis Borders/Right".disabled = true
		$"../Invis Borders/Left".disabled = true

func _on_body_entered(body: Node2D) -> void:
	if body != player:
		enemy_count += 1
		print(enemy_count)


func _on_body_exited(body: Node2D) -> void:
	if body != player:
		enemy_count -= 1
		print(enemy_count)
