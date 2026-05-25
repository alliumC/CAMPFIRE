extends VBoxContainer


var item_equipped = 1


func _ready() -> void:
	$"Slot 1".modulate.a = 0.7
	$"Slot 2".modulate.a = 0.7
	$"Slot 3".modulate.a = 0.7


func _on_button_toggled(_toggled_on: bool) -> void:
	$"Slot 1".modulate.a = 1.0
	$"Slot 2".modulate.a = 0.7
	$"Slot 3".modulate.a = 0.7


func _on_button_2_toggled(_toggled_on: bool) -> void:
	$"Slot 1".modulate.a = 0.7
	$"Slot 2".modulate.a = 1.0
	$"Slot 3".modulate.a = 0.7


func _on_button_3_toggled(_toggled_on: bool) -> void:
	$"Slot 1".modulate.a = 0.7
	$"Slot 2".modulate.a = 0.7
	$"Slot 3".modulate.a = 1.0
