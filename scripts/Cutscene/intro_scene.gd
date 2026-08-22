extends Control
signal skipped
@onready var canvas_layer: CanvasLayer = $Camera2D/CanvasLayer
@onready var dialogue_system = GameSystemsScript.instantiateDialogueSystem(canvas_layer)
@onready var IntroText: RichTextLabel = $RichTextLabel
@onready var time_until_skip: Timer = $TimeUntilSkip
@onready var skip: RichTextLabel = $Skip
var dialogue = [
	{ "Rene" : ["Cassius!", 0.1] },
]

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		skipped.emit()

func _ready() -> void:
	dialogue_system.visible = false
	
	set_process_input(false)
	await textShow("[wave][i]They were always the more fortunate one.[/i][/wave]")
	await textShow("[wave][i]Despite you both being under the same devotion to it,[/i][/wave]")
	await textShow("[wave][i]It always seemed like they were the “favorite”.[/i][/wave]")
	await textShow("[wave][i]And even now…[/i][/wave]")
	
	await dialogue_system.show_dialogue_box(dialogue, 0.05)
	
	SceneLoader.load_scene("uid://byk555wkqyfg6", 1.5)

func textShow(text : String):
	IntroText.text = text
	time_until_skip.start()
	await time_until_skip.timeout
	skip.visible = true
	set_process_input(true)
	await skipped
	skip.visible = false
	set_process_input(false)
	IntroText.text = ""
	await get_tree().create_timer(1).timeout
