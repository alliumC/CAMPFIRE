extends TextureProgressBar
@onready var player: Player

func update():
	value = player.current_health * 100 / player.max_healh
	print(value)
