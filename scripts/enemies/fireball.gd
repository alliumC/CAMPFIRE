extends Area2D

@export var speed: float = 100
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox: CollisionShape2D = $CollisionShape2D
@onready var light: PointLight2D = $PointLight2D2

var playerpos 

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.currentHealth -= 40

func _process(delta: float) -> void:
	var direction = (playerpos - global_position)
	
	if direction.length() > 1.0:
		direction = direction.normalized()
		
		global_position += direction * speed * delta
	else:
		self.queue_free()
