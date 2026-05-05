extends Area2D


func _on_area_entered(_area: Area2D) -> void:
	get_tree().call_deferred("change_scene_to_file", "uid://cd2ekv3lcnfgt")
