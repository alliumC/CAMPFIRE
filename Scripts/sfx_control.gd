extends HSlider

var audio_bus_id
var db = linear_to_db(value)

func _ready():
	audio_bus_id = AudioServer.get_bus_index("SFX")
	randomize()

@warning_ignore("shadowed_variable_base_class", "unused_parameter")
func _on_value_changed(value: float) -> void:
	set_vol()


func set_vol():
	db = linear_to_db(value)
	var sfx = randi_range(1, 3)
	if sfx == 1:
		Sfx.sword.play()
	elif sfx== 2:
		Sfx.fireball.play()
	elif sfx == 3:
		Sfx.potion.play()
	db = linear_to_db(value)
	AudioServer.set_bus_volume_db(audio_bus_id, db)

	
