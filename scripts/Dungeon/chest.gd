extends StaticBody2D

@onready var interactable: Area2D = $Interactable
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact():
	if interactable.is_interactable:
		animated_sprite_2d.play("open")
		interactable.is_interactable = false
		print("Opened Chest")
