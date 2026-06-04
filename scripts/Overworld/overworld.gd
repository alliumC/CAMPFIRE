extends Node
const DIALOGUE_SYSTEM = preload("uid://bdeitmfdw0a3s")
@onready var canvas_layer: CanvasLayer = $Map/Player/CanvasLayer

func _ready() -> void:
	var dialogue_system = DIALOGUE_SYSTEM.instantiate()
	canvas_layer.add_child(dialogue_system)
	dialogue_system.show_dialogue_box("Cassius", "Lorem ipsum [wave] meow [/wave]", 0.05)
