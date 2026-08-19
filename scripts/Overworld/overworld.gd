extends Node
@onready var canvas_layer: CanvasLayer = $Map/Player/DialogueLayer
@onready var dialogue_system = GameSystemsScript.instantiateDialogueSystem(canvas_layer)
var dialogue1 = [
	{ "Cassius" : ["...", 0.7] },
	{ "Cassius" : ["...[shake]Where am I?[/shake]", 0.05] },
	{ "Cassius" : ["Is this the village's forest grounds? ", 0.05] }
]

func _ready() -> void:
	await dialogue_system.show_dialogue_box(dialogue1, 0.05)
	
	await get_tree().create_timer(1.0).timeout
