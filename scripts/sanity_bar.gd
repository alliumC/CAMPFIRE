extends TextureProgressBar

@onready var Dep = $Depletion

func _ready() -> void:
	Dep.start()

func _on_depletion_timeout() -> void:
	self.value -= 1
