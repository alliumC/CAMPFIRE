extends Node
@onready var sword: AudioStreamPlayer = $Sword
@onready var fireball: AudioStreamPlayer = $Fireball
@onready var riser: AudioStreamPlayer = $Riser
@onready var potion: AudioStreamPlayer = $Potion

func _ready() -> void:
	sword.volume_db = -11
	fireball.volume_db = -4
	potion.volume_db = -8
