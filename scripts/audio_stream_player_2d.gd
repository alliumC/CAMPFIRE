extends AudioStreamPlayer2D

@onready var sound = $"."

func _on_area_2d_body_entered(body: CollisionShape2D) -> void:
	sound.play()
