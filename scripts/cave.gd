extends Area2D
const DUNGEON = preload("uid://cd2ekv3lcnfgt")

func _on_area_entered(_area: Area2D) -> void:
	var dungeon_path : String = DUNGEON.resource_path
	SceneLoader.load_scene(dungeon_path, 1)
