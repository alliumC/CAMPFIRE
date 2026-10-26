extends Control


func _ready() -> void:
	set_process_input(false)
	var balloon = DialogueManager.show_dialogue_balloon(load("uid://biets1ua616r5"), "intro")
	await balloon.tree_exited
	get_tree().change_scene_to_file("uid://byk555wkqyfg6")
	#SceneLoader.load_scene("uid://jlnpext5p3g1", 1.5) -- Goes to the prologue, will reconnect when the actual tutorial is done
