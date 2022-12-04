extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var ball = get_node("../Ball")
	var pos = ball.transform.origin
	transform.origin = Vector3(pos.x, pos.y+100, pos.z+125)

