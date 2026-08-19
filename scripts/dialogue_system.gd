class_name Dialogue
extends Control
signal dialogue_skipped
signal dialogue_ended

@onready var dialogue_box: TextureRect = $DialogueBox
@onready var speaker_profile: TextureRect = $DialogueBox/SpeakerProfile
@onready var text_container: VBoxContainer = $DialogueBox/TextContainer

@onready var character_name: RichTextLabel = $DialogueBox/TextContainer/CharacterName
@onready var character_dialogue: RichTextLabel = $DialogueBox/TextContainer/CharacterDialogue
@onready var skip_button: TextureRect = $DialogueBox/SkipButton

@onready var dialogue_speed: Timer = $DialogueSpeed

func _ready():
	character_name.text = ""
	character_dialogue.text = ""
	character_dialogue.visible_characters = 0
	
func _input(event: InputEvent) -> void:
	if character_dialogue.visible_characters != -1:
		if event.is_action_pressed("interact"):
			dialogue_skipped.emit()
	else:
		if event.is_action_pressed("interact"):
			dialogue_ended.emit()
	

#img_path: Texture2D, 

func show_dialogue_box(char_name: String, dialogue: Array, speed: float):
	#speaker_profile.texture = img_path
	character_name.text = char_name
	dialogue_speed.wait_time = speed	
	for i in dialogue:
		skip_button.visible = false
		character_dialogue.bbcode_text = i
		dialogue_speed.start()
		await dialogue_ended
		if dialogue.find(i, 0) == dialogue.size() - 1:
			self.queue_free()
		else:
			character_dialogue.visible_characters = 0
	
func _on_dialogue_speed_timeout() -> void:
	if character_dialogue.visible_characters < character_dialogue.text.length():
		character_dialogue.visible_characters += 1
	else:
		character_dialogue.visible_characters = -1
		dialogue_speed.stop()

func _on_dialogue_ended() -> void:
	skip_button.visible = true

func _on_dialogue_skipped() -> void:
	character_dialogue.visible_characters = -1
	dialogue_speed.stop()
	skip_button.visible = true
