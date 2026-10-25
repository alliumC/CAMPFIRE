extends Node2D

@onready var boss: BOSS = $BOSS
@onready var boss_mus: AudioStreamPlayer = $"boss mus"

func _ready() -> void:
	boss.process_mode = Node.PROCESS_MODE_DISABLED
	var balloon = DialogueManager.show_dialogue_balloon(load("uid://dl83j2l4bwvee"), "start")
	await balloon.tree_exited
	boss.process_mode = Node.PROCESS_MODE_INHERIT
	boss_mus.play()
