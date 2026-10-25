extends Node2D

func _ready() -> void:
	await get_tree().create_timer(2.0).timeout
	DialogueManager.show_dialogue_balloon(load("uid://c7ckjmg8rw8pm"), "start")
	Music.dungeon.play()
