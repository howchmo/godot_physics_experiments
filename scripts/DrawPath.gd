extends Path

export var draw = true

func draw_debug_sphere(loc, size):
		var scene_root = get_tree().root.get_children()[0]
		var s = SphereMesh.new()
		s.radial_segments = 4
		s.rings = 4
		s.radius = size
		s.height = 2*size
		var mat = SpatialMaterial.new()
		mat.albedo_color = Color(1,0,0)
		mat.flags_unshaded = true
		s.surface_set_material(0, mat)
		var node = MeshInstance.new()
		node.mesh = s
		node.global_transform.origin = loc
		scene_root.add_child(node)

func dup_and_place( loc ):
	var dot = $Dot
	# dot = dot.duplicate()
	dot.get_global_transform().origin = loc

# Called when the node enters the scene tree for the first time.
func _ready():
	for pt in curve.get_baked_points():
		draw_debug_sphere(pt, 4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
