extends Control


func _ready() -> void:
	set_process_input(false)
	var balloon = DialogueManager.show_dialogue_balloon(load("uid://biets1ua616r5"), "intro")
	await balloon.tree_exited
	SceneLoader.load_scene("uid://byk555wkqyfg6", 1.5)
