extends Node2D


export (int) var born : int = 0
export (int) var life_span : int = 0
# in millis


# Called when the node enters the scene tree for the first time.
func _ready():
	life_span = 1000*round(randf()*10)
	born = OS.get_system_time_msecs()

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func is_dead():
	var now = OS.get_system_time_msecs() #round(time.time() * 1000)
	return born + life_span < now
