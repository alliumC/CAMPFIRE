extends Node2D
@onready var canvas_layer: CanvasLayer = $Camera/CanvasLayer
@onready var dialogue_system = GameSystemsScript.instantiateDialogueSystem(canvas_layer)

var dialogue1 = [
	{ "Cassius" : ["Rene?", 0.1] },
	{ "Cassius" : ["Where are you?", 0.1] }
]

func _ready() -> void:
	await get_tree().create_timer(2.0).timeout
	Music.dungeon.play()
	dialogue_system.visible = false
	await dialogue_system.show_dialogue_box(dialogue1, 0.05)
