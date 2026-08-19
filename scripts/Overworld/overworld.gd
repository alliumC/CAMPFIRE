extends Node
@onready var canvas_layer: CanvasLayer = $Map/Player/CanvasLayer
@onready var dialogue_system = GameSystemsScript.instantiateDialogueSystem(canvas_layer)
var dialogue = {
	"Dialogue1" = {
		"Cassius" : "oui oui baguette",
		"Rene" : "Welcome or Welcome Back"
	},
	
	"Dialogue2" = {
		"Cassius" : "This is the second dialogue",
		"Rene" : "Yeah we're gonna die now"
	}
}

func _ready() -> void:
	dialogue_system.show_dialogue_box(dialogue["Dialogue1"], 0.05)
	
	
