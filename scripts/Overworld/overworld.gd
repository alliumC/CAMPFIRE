extends Node
@onready var player: Player = $Map/Player

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(load("uid://biets1ua616r5"), "start")
	
	await get_tree().create_timer(1.0).timeout
