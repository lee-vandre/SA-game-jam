extends VehicleBody3D;

@export var cameraController : Node3D;
@export var cameraTarget : Node3D;

var camT := float();
var camSpeed := float();

const MAX_STEER := 0.8;
const ENGINE_POWER := 400;

var torque_strength = 500
@onready var ray : RayCast3D= $RayCast3D

func _ready() -> void:
	$RayCast3D.enabled = true;
	pass # Replace with function body.


func smoothCamFollow(delta) -> void:
	var camOffset = Vector3(0,1.5,0).rotated(Vector3.UP,camT);
	camSpeed = 500;
	var camTimer = clamp(delta *camSpeed/ 20,0,1);
	cameraController.global_transform.origin = cameraController.global_transform.origin.lerp(self.global_transform.origin + camOffset,camTimer);

func _physics_process(delta) -> void:
	var pitch =  Input.get_axis("back", "forward")
	var roll = Input.get_axis("left", "right")
	if !ray.is_colliding():
		apply_front_torque(torque_strength * pitch)
		apply_local_yaw_torque(torque_strength * roll)




func moveForward() -> void:
	engine_force = Input.get_axis("back","forward") * ENGINE_POWER;
	
	
func _process(delta) -> void:
	smoothCamFollow(delta);
	steering = lerp(steering,Input.get_axis("right","left") * MAX_STEER,5 * delta);
	if linear_velocity.x > 0.1 :
		center_of_mass.x = Input.get_axis("right","left")*0.4
	elif linear_velocity.x < -0.1:
		center_of_mass.x = Input.get_axis("right","left")*-0.4
	else:
		center_of_mass.x = 0
	moveForward();
	print(linear_velocity);
	pass

# Apply torque around the local Y-axis
func apply_local_yaw_torque(strength) -> void:
	# Local Y-axis in the node's current orientation
	var local_z_axis = transform.basis.z;
	# Apply torque around the local Y-axis
	apply_torque(local_z_axis * strength);
	

func apply_front_torque(strength) -> void:
	var local_axis = transform.basis.x
	apply_torque(local_axis * strength)
