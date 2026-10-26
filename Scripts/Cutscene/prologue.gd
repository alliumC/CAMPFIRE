extends Node
@onready var animation_player: AnimationPlayer = $fade/AnimationPlayer

# Cutscene Sprites
@onready var cutscene_screen_1: Sprite2D = $CutsceneScreen1
@onready var cutscene_screen_2: Sprite2D = $CutsceneScreen2
@onready var cutscene_screen_3: Sprite2D = $CutsceneScreen3

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(load("uid://5s6aoclv220n"), "start")
	await DialogueManager.dialogue_ended
	animation_player.play("fade")
	
	await animation_player.animation_finished
	
	DialogueManager.show_dialogue_balloon(load("uid://5s6aoclv220n"), "continued")
	
	SceneLoader.load_scene("uid://d4bs0ij7wp8ug", 1.5)
