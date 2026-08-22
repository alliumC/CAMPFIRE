extends VBoxContainer


var item_equipped = 1


func _ready() -> void:
	$"Slot 1".modulate.a = 0.7
	$"Slot 2".modulate.a = 0.7
	$"Slot 3".modulate.a = 0.7


func _on_button_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		$"Slot 1".modulate.a = 1.0
		$"Slot 2".modulate.a = 0.7
		$"Slot 3".modulate.a = 0.7
		GlobalScript.item1_equipped = true
		GlobalScript.item2_equipped = false
		GlobalScript.item3_equipped = false
	else:
		$"Slot 1".modulate.a = 0.7
		$"Slot 2".modulate.a = 0.7
		$"Slot 3".modulate.a = 0.7
		GlobalScript.item1_equipped = false
		GlobalScript.item2_equipped = false
		GlobalScript.item3_equipped = false
		


func _on_button_2_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		$"Slot 1".modulate.a = 0.7
		$"Slot 2".modulate.a = 1.0
		$"Slot 3".modulate.a = 0.7
		GlobalScript.item1_equipped = false
		GlobalScript.item2_equipped = true
		GlobalScript.item3_equipped = false
	else:
		$"Slot 1".modulate.a = 0.7
		$"Slot 2".modulate.a = 0.7
		$"Slot 3".modulate.a = 0.7
		GlobalScript.item1_equipped = false
		GlobalScript.item2_equipped = false
		GlobalScript.item3_equipped = false
		


func _on_button_3_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		$"Slot 1".modulate.a = 0.7
		$"Slot 2".modulate.a = 0.7
		$"Slot 3".modulate.a = 1.0
		GlobalScript.item1_equipped = false
		GlobalScript.item2_equipped = false
		GlobalScript.item3_equipped = true
	else:
		$"Slot 1".modulate.a = 0.7
		$"Slot 2".modulate.a = 0.7
		$"Slot 3".modulate.a = 0.7
		GlobalScript.item1_equipped = false
		GlobalScript.item2_equipped = false
		GlobalScript.item3_equipped = false
	
