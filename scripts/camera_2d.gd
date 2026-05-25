extends Camera2D

@export var camera: Node2D
@onready var up: Area2D = $"../Up"
@onready var left: Area2D = $"../Left"
@onready var down: Area2D = $"../Down"
@onready var right: Area2D = $"../Right"

func _ready() -> void:
	camera.position = Vector2(0, -0.5)


func _on_up_body_entered(body: Node2D) -> void:
	if body is Player:
		camera.position += Vector2(0, -192)


func _on_down_body_entered(body: Node2D) -> void:
	if body is Player:
		camera.position += Vector2(0, 192)


func _on_left_body_entered(body: Node2D) -> void:
	if body is Player:
		camera.position += Vector2(-336, 0)


func _on_right_body_entered(body: Node2D) -> void:
	if body is Player:
		camera.position += Vector2(336, 0)
