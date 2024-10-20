extends VehicleBody3D;

@export var cameraController : Node3D;
@export var cameraTarget : Node3D;

var camT := float();
var camSpeed := float();

const MAX_STEER := 0.8;
const ENGINE_POWER := 400;

var torque_strength = 100


func _ready() -> void:
	$RayCast3D.enabled = true;
	pass # Replace with function body.


func smoothCamFollow(delta) -> void:
	var camOffset = Vector3(0,1.5,0).rotated(Vector3.UP,camT);
	camSpeed = 500;
	var camTimer = clamp(delta *camSpeed/ 20,0,1);
	cameraController.global_transform.origin = cameraController.global_transform.origin.lerp(self.global_transform.origin + camOffset,camTimer);

func _physics_process(delta) -> void:
	if Input.is_action_pressed("leftTilt"):
		apply_local_yaw_torque(-torque_strength)
	# Rotate right
	if Input.is_action_pressed("rightTilt"):
		apply_local_yaw_torque(torque_strength)




func moveForward() -> void:
	engine_force = Input.get_axis("back","forward") * ENGINE_POWER;
	
	
func _process(delta) -> void:
	smoothCamFollow(delta);
	steering = lerp(steering,Input.get_axis("right","left") * MAX_STEER,5 * delta);
	moveForward();
	print(linear_velocity);
	pass

# Apply torque around the local Y-axis
func apply_local_yaw_torque(strength) -> void:
	# Local Y-axis in the node's current orientation
	var local_z_axis = transform.basis.z;
	# Apply torque around the local Y-axis
	apply_torque(local_z_axis * strength);
	
