extends PathFollow3D

var rb
@export var node_path = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	rb = get_node(node_path)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var o = $"../../Path".curve.get_closest_offset(rb.global_transform.origin)
	set_progress(o)
