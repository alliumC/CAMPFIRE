extends Node2D

signal loading_screen_ready

@export var animation_player : AnimationPlayer
var duration = 0

func _ready() -> void:
	var tw = create_tween().set_ignore_time_scale(true).tween_property(self, "modulate:a", 1, 1)
	await tw.finished
	get_tree().paused = true
	loading_screen_ready.emit()
	
func _on_progress_changed(_new_value: float) -> void:
	pass
		
func _on_load_finished() -> void:
	await get_tree().create_timer(duration).timeout
	var tw = create_tween().set_ignore_time_scale(true).tween_property(self, "modulate:a", 0, 1)
	await tw.finished
	get_tree().paused = false
	queue_free()
