extends RigidBody

export var T = 0.0
export var roll = false # r = x
export var yaw = false # q = y
export var pitch = false # p = z
export var current_rotation = Quat()
export var target_rotation = Quat()
export var rot_diff = Quat()
export var agg = 0.0
export var threshold = 0.001
export var Kp = 0.0
export var Ki = 0.0
var start_angle = 0.0
var f = true


# Called when the node enters the scene tree for the first time.
func _ready():
	target_rotation = Quat(0,0,.707,.707)
	start_angle = current_rotation.angle_to(target_rotation)
	add_central_force(Vector3(0,weight,0))

func quat_approximately_equal( a, b, t ):
	rot_diff = a - b
	var diff = rot_diff
	if abs(diff.x) <= t and abs(diff.y) <= t and abs(diff.z) <= t and abs(diff.w) <= t:
		return true
	else:
		return false


func _physics_process(delta):
	add_central_force(Vector3(0,weight,0))
	if f and linear_velocity.y > 0.01:
		linear_velocity.y = 0.0
		transform.origin.y = 0.0
		f = false
	current_rotation = Quat(global_transform.basis)
	var e = current_rotation.angle_to(target_rotation)/start_angle
	Kp = pow(e,2)
	if Kp > threshold:
		pitch = true
	else:
		pitch = false
	if roll:
		add_torque(transform.basis.x*T*Kp)
	if pitch:
		add_torque(transform.basis.z*T*Kp)
	if yaw:
		add_torque(transform.basis.y*T*Kp)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
