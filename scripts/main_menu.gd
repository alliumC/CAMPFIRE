extends Control

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()

func _ready():
	$AudioStreamPlayer.play()
	lower_pitch_loop()

func lower_pitch_loop():
	while true:
		await get_tree().create_timer(32.65).timeout
		if $AudioStreamPlayer.pitch_scale > 0.7:
			$AudioStreamPlayer.pitch_scale -= 0.03
