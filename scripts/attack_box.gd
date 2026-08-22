extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite_2d.play("attack")
	
	await animated_sprite_2d.animation_finished
	
	self.queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is enemy:
		body.health -= 10
