extends Sprite2D

@onready var interactable: Interactable = $Interactable
@onready var cassius: Player = $"../../../Player"


func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact():
	var balloon = DialogueManager.show_dialogue_balloon(load("uid://c7ckjmg8rw8pm"), "pentagram")
	await balloon.tree_exited
	cassius.canFight = true
	
