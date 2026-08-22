extends VBoxContainer


var item_equipped = 1

@onready var inv_1_cooldown: ColorRect = $"Slot 1/Inv1Cooldown"
@onready var inv_2_cooldown: ColorRect = $"Slot 2/Inv2Cooldown"
@onready var inv_3_cooldown: ColorRect = $"Slot 3/Inv3Cooldown"

func _ready() -> void:
	$"Slot 1".modulate.a = 0.7
	$"Slot 2".modulate.a = 0.7
	$"Slot 3".modulate.a = 0.7
	inv_1_cooldown.grow_vertical = Control.GROW_DIRECTION_END
	inv_2_cooldown.grow_vertical = Control.GROW_DIRECTION_END
	inv_3_cooldown.grow_vertical = Control.GROW_DIRECTION_END


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
	
func cooldown(invslot : ColorRect, duration : float):
	invslot.visible = true
	var tw = create_tween().tween_property(invslot, "size:y", 0, duration)
	await tw.finished
	invslot.size.y = 83
	invslot.visible = false
