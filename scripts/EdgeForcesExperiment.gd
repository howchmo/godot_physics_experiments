extends RigidBody

export var f = 0.0
export var r = 0.0
export var euler = Vector3(0,0,0)
export var push = false
export var turn = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# func do_the_thing( delta ):
 
	# Determine heading to point at target limited by maximum turn rate
#	var targetHeading = position - transform.basis.looking_at
#	adjustedTargetHeading = Vector3.RotateTowards(transform.forward, targetHeading, maxTurnRadians, maxTurnSpeed);

#	# The angle controller drives the ship's angle towards the target angle.
#	Vector3 headingError = Vector3.Cross(transform.forward, adjustedTargetHeading);
#	Vector3 headingCorrection = VectorTuning.GetCorrection(headingError, dt);

## The angular velocity controller drives the ship's angular velocity to 0.
#Vector3 angularVeocityError = rigidbody.angularVelocity * -1f;
#Vector3 angularVelocityCorrection = AngularVelocityTuning.GetCorrection(angularVeocityError, dt);

# The total torque from both controllers is applied to the ship.
# rigidbody.AddTorque(headingCorrection + angularVelocityCorrection);

# Use the error between forward and velocity to apply thrust
# float thrustVectorError = Vector3.Angle(rigidbody.velocity, transform.forward);
# for normalized vectors 1:ahead, -1:behind, 0:perpendicular
# float relativeVectorError = Vector3.Dot(rigidbody.velocity.normalized, transform.forward.normalized);
# float thrust = thrustMagnitude * ThrustTuning.GetCorrection(thrustVectorError, dt) * relativeVectorError;
# Debug.Log("vec: " + thrustVectorError + " ... rel: " + relativeVectorError + " ... thr: " + thrust + " ... mag: " + rigidbody.velocity.magnitude);

# // Apply thrust
# if ((thrust < 0 && rigidbody.velocity.magnitude > 0) || (thrust > 0 && rigidbody.velocity.magnitude < maxVelocity))
# {
# 	rigidbody.AddForce(transform.forward * thrust);
# }

# Called when the node enters the scene tree for the first time.
func _ready():
	add_central_force(Vector3(0,weight,0))

func _physics_process( delta ):
	# add_central_force(Vector3(0,weight,0))
	if push:
		euler = transform.basis.get_euler()
		var mv = Vector3(0,0,f).rotated(Vector3(0,1,0), euler.y)
		apply_central_impulse(mv)
	if turn:
		r = r + 5*delta
	var w = 20*f
	var v1 = Vector3(w,0,0).rotated(Vector3(0,1,0), deg2rad(r))
	var v2 = Vector3(-w,0,0).rotated(Vector3(0,1,0), deg2rad(r))
	add_force(v1, Vector3(1,0,2))
	# add_force(v2, Vector3(-1,0,2))
	# add_force(Vector3(w,0,0), Vector3(1,0,-2))
	# add_force(Vector3(-w,0,0), Vector3(-1,0,-2))
	if r >= 45.0:
		turn = false
# func _integrate_forces(state):
#	print(state)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
