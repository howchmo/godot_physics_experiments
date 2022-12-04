extends RigidBody3D

@export var push = false
@export var reverse = false
@export var f = 0.0
var o
@export var node_path = ""

func _ready():
	# o = get_node(node_path)
	o = $"../../Track2/Path/PathFollow/CSGBox"

func _physics_process( delta ):
	if push or reverse:
		var new_force = o.global_transform.basis * Vector3(0,0,f)
		if reverse:
			new_force = -new_force
		apply_central_impulse(new_force)
