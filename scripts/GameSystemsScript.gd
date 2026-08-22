extends Node
const DIALOGUE_SYSTEM = preload("uid://bdeitmfdw0a3s")

func instantiateDialogueSystem(canvas):
	var dialogue_system = DIALOGUE_SYSTEM.instantiate()
	canvas.add_child(dialogue_system)
	
	return dialogue_system
