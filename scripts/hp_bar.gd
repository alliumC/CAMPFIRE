extends TextureProgressBar

@export var player: Player

func _ready():
	update()

func update():
	value = player.currentHealth
