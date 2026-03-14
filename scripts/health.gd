extends ProgressBar

var parent
var Character

func _ready():
	parent=get_parent()
	max_value=parent.maxHealth
	min_value=parent.minHealth

func _process(_delta):
	ShowBar()
	
func ShowBar():
	if parent.health!=max_value:
		if parent.health > min_value:
			value=parent.health
			self.visible=true
		else:
			parent.health=0
			self.visible=false
	else:
		self.visible=false
