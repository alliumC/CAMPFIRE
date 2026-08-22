extends Node
@onready var boss: AudioStreamPlayer = $Boss
@onready var daisy_bell: AudioStreamPlayer = $DaisyBell
@onready var dungeon: AudioStreamPlayer = $Dungeon

func  _ready() -> void:
	boss.volume_db = -6
