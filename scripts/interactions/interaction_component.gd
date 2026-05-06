extends Node2D

@onready var label: Label = $Label
var current_interacions := []
var can_interact := true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and can_interact:
		if current_interacions:
			can_interact = false
			label.hide()
			
			await current_interacions[0].interact.call()
			
			can_interact = true


func _process(_delta: float) -> void:
	if current_interacions and can_interact:
		current_interacions.sort_custom(_sort_by_nearest)
		if current_interacions[0].is_interactable:
			label.text = current_interacions[0].interact_name
			label.show()
	else:
		label.hide()


func _sort_by_nearest(area1, area2):
	var area1_dist = global_position.distance_to(area1.global_position)
	var area2_dist = global_position.distance_to(area2.global_position)
	return area1_dist < area2_dist
	
func _on_interact_range_area_entered(area: Area2D) -> void:
	if area is Interactable:
		current_interacions.push_back(area)

func _on_interact_range_area_exited(area: Area2D) -> void:
	if area is Interactable:
		current_interacions.erase(area)
