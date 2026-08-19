extends Node
@onready var canvas_layer: CanvasLayer = $Map/Player/CanvasLayer
@onready var dialogue_system = GameSystemsScript.instantiateDialogueSystem(canvas_layer)
var dialogue = {
	"Dialogue1" = [
		"""Lorem ipsum dolor sit amet, [shake] consectetur adipiscing elit [/shake]. 
In vel sapien nec ligula lobortis varius vel sit amet justo. Pellentesque sodales faucibus odio""",
		"""Welcome or Welcome Back!"""
	]
}

func _ready() -> void:
	dialogue_system.show_dialogue_box("Cassius", dialogue["Dialogue1"], 0.05)
	
