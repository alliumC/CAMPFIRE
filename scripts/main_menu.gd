extends Control

@onready var main_buttons: VBoxContainer = $"Main Buttons"
@onready var settings: Panel = $Settings
@onready var button_bg: TextureRect = $"Button BG"
@onready var title: Label = $Title

func _ready():
	title.visible = true
	main_buttons.visible = true
	button_bg.visible = true
	settings.visible = false
	lower_pitch_loop()

func _on_start_pressed() -> void:
	SceneLoader.load_scene("uid://clytsc0uwupa1", 1)

func _on_options_pressed() -> void:
	title.visible = false
	main_buttons.visible = false
	button_bg.visible = false
	settings.visible = true

func _on_quit_pressed() -> void:
	get_tree().quit()



func lower_pitch_loop():
	while true:
		await get_tree().create_timer(32.65).timeout
		if $AudioStreamPlayer.pitch_scale > 0.7:
			$AudioStreamPlayer.pitch_scale -= 0.03

func _on_back_options_pressed() -> void:
	title.visible = true
	main_buttons.visible = true
	button_bg.visible = true
	settings.visible = false
