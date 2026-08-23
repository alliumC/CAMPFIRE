extends Control

@onready var main_buttons: VBoxContainer = $"Main Buttons"
@onready var settings: Panel = $Settings
@onready var button_bg: TextureRect = $"Button BG"
@onready var title: Label = $Title
@onready var daisy_bell: AudioStreamPlayer = $"Daisy Bell"


func _ready():
	title.visible = true
	main_buttons.visible = true
	button_bg.visible = true
	settings.visible = false
	daisy_bell.play()
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
		await get_tree().create_timer(32.75).timeout
		if daisy_bell.pitch_scale > 0.7:
			daisy_bell.pitch_scale -= 0.03
		else: 
			daisy_bell.pitch_scale = 1

func _on_back_options_pressed() -> void:
	title.visible = true
	main_buttons.visible = true
	button_bg.visible = true
	settings.visible = false
