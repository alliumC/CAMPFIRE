extends Node2D

@onready var cassius: Player = $Player
@export var shrine_check: Area2D
var firstenter: bool = true

func _ready() -> void:
	await get_tree().create_timer(2.0).timeout
	var balloon = DialogueManager.show_dialogue_balloon(load("uid://c7ckjmg8rw8pm"), "start")
	await balloon.tree_exited
	cassius.canFight = true
	Music.dungeon.play()

func _on_shrine_check_body_entered(body: Node2D) -> void:
	if firstenter and body == cassius:
		DialogueManager.show_dialogue_balloon(load("uid://c7ckjmg8rw8pm"), "shrine")
		firstenter = false
