extends ProgressBar

var parent
var Character

func _ready():
	parent=get_parent()
	max_value=parent.max_health
	min_value=parent.min_health

func _process(_delta):
	value=parent.health
	if parent.health!=max_value and parent.health!=min_value:
		self.visible=true
	elif parent.health <= parent.min_health:
		parent.health=0
		self.visible=false
		print("dead")
	else:
		self.visible=false
