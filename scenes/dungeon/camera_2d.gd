extends Camera2D

@onready var screen_size: Vector2 = get_viewport_rect(). size
@onready var player_node = get_parent().get_node("Player")

func _ready() -> void:
	set_screen_position()
	await get_tree().process_frame
	position_smoothing_enabled = true
	position_smoothing_speed = 7
#
func _process(_delta: float) -> void:
	set_screen_position()

func set_screen_position():
	var player_pos = player_node.global_position
	var x = floor(player_pos.x / screen_size.x) * screen_size.x + screen_size.x / 2
	var y = floor(player_pos.y / screen_size.y) * screen_size.y + screen_size.y / 2
	global_position = Vector2(x , y)
