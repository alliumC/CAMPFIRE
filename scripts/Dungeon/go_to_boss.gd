extends Area2D
const BOSSROOM = preload("uid://13uvevqqwlpf")
@onready var player: Player = $"../../Player"

func _on_body_entered(body: Node2D) -> void:
	if body == player:
		var tween = create_tween()
		tween.tween_property(Music.dungeon, "volume_db", -80, 0.75)
		Music.dungeon.stop()
		var boss_path : String = BOSSROOM.resource_path
		SceneLoader.load_scene(boss_path, 1)
