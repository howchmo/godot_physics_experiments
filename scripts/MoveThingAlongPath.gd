extends PathFollow

export var speed = 0.0

func _process(delta):
	set_offset(get_offset()+speed*delta)
