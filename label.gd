extends Label


var health: int = 100

func _ready():
	update_health()
	
	
func update_health():
	text = ':\\ > ' + str(health)
