extends TileMap

@onready var player = "res://scenes/player.tscn"
func _ready():
	player.enable_light()
