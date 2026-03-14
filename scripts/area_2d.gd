extends Area2D


func _on_area_entered(_area: Area2D) -> void:
	get_tree().change_scene_to_file("res://scenes/dungeon.tscn")
