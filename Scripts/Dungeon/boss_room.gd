extends Node2D

func _ready() -> void:
	var tween = create_tween()
	await get_tree().create_timer(0.5).timeout
	Music.boss.volume_db = -80.0
	Music.boss.play()
	tween.tween_property(Music.boss, "volume_db", 0.0, 0.5)
