extends Area2D

@onready var dungeon_music = $Dungeon
@onready var boss_music = $Boss

var triggered = false

func _on_area_entered(Area2D):
	if triggered:
		return
	
	triggered = true
	
	var tween = create_tween()
	
	# Fade out dungeon music
	tween.tween_property(dungeon_music, "volume_db", -40, 1)
	
	# Start boss music quietly
	boss_music.volume_db = -30
	boss_music.play()
	
	# Fade boss music in
	tween.tween_property(boss_music, "volume_db", 0, 1)
