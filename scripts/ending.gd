extends Node2D
@onready var canvas_layer: CanvasLayer = $Camera2D/CanvasLayer
@onready var node: Node = $Node
@onready var dialogue_system = GameSystemsScript.instantiateDialogueSystem(canvas_layer)
@onready var title: RichTextLabel = $Title
@onready var sub: RichTextLabel = $sub
@onready var sub2: RichTextLabel = $sub2
var dialogue1 = [
	{ "Cassius" : ["Rene?", 0.3] },
]
var lastText = [
	"YOU WILL NEVER BE ENOUGH",
	"YOU KNOW THEY WERE ALWAYS BETTER",
	"WHAT WOULD YOU EVEN BE ABLE TO DO",
	"DO YOU TRULY SEEK ENLIGHTENMENT",
	"DO YOU DARE FULFILL YOUR DUTY"
]

func _ready() -> void:
	dialogue_system.visible = false
	await dialogue_system.show_dialogue_box(dialogue1, 0.05)
	
	await get_tree().create_timer(2).timeout
	Sfx.riser.volume_db = 0
	Sfx.riser.play(1)
	for i in 220:
		var text = lastText[randi_range(0, 4)]
		
		var textCont = RichTextLabel.new()
		textCont.add_theme_color_override("default_color", Color.WHITE)
		textCont.custom_minimum_size = Vector2(500, 50)
		textCont.autowrap_mode = TextServer.AUTOWRAP_WORD
		var view_size = get_viewport().get_visible_rect().size
	
		var random_x = randi() % int(view_size.x / 10 + 1) * 10
		var random_y = randi() % int(view_size.y / 10 + 1) * 10
		textCont.global_position = Vector2(random_x, random_y)
		textCont.text = text
		node.add_child(textCont)
		
		await get_tree().create_timer(0.01).timeout
		
	node.queue_free()
	
	title.visible = true
	
	await get_tree().create_timer(1).timeout
	
	create_tween().tween_property(sub, "modulate:a", 1, 2).set_ease(Tween.EASE_IN_OUT)
	
	await get_tree().create_timer(3). timeout
	
	create_tween().tween_property(sub2, "modulate:a", 1, 2).set_ease(Tween.EASE_IN_OUT)
