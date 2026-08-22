extends HSlider

@export var audio_bus_name: String
var audio_bus_id

func _ready():
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)
	randomize()

@warning_ignore("shadowed_variable_base_class")
func _on_value_changed(value: float) -> void:
	var sfx = randi_range(1, 3)
	if sfx == 1:
		Sfx.sword.play()
	elif sfx== 2:
		Sfx.fireball.play()
	elif sfx == 3:
		Sfx.potion.play()
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(audio_bus_id, db)
