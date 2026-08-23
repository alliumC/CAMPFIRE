extends HSlider

var db: float = linear_to_db(value)
var audio_bus_id


func _ready():
	audio_bus_id = AudioServer.get_bus_index("Music")
	set_vol()


@warning_ignore("unused_parameter", "shadowed_variable_base_class")
func _on_value_changed(value: float) -> void:
	set_vol()


func set_vol():
	db = linear_to_db(value)
	AudioServer.set_bus_volume_db(audio_bus_id , db)
