extends Node3D

@export var cameraTarget :Node3D
@export var pitchMax = 50
@export var pitchMin = -50

var yaw = float()
var pitch = float()
var yaw_sensitivity = .002
var pitch_sensitivity = .002


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.

func _input(event):
	
	if event is InputEventMouseMotion and Input.get_mouse_mode() != 0:
		yaw += -event.relative.x * yaw_sensitivity
		pitch += event.relative.y * pitch_sensitivity


func _physics_process(delta):
	
	cameraTarget.rotation.y =lerpf(cameraTarget.rotation.y,yaw,delta*10)
	cameraTarget.rotation.x = lerpf(cameraTarget.rotation.x,pitch,delta * 10)
	
	pitch = clamp(pitch,deg_to_rad(pitchMin), deg_to_rad(pitchMax))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
