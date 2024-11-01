extends Node3D

@export var boost :int =30;
@export var car: VehicleBody3D

@onready var rigidbody : RigidBody3D = $rocketbody
@onready var isRocketAttached:bool = true
var rocketFuel := 100
# Called when the node enters the scene tree for the first time.
func _ready():
	rigidbody.freeze = true


func _physics_process(delta):
	
	apply_rocket_boost(boost)
	if Input.is_action_just_pressed("RightMouseButton"):
		detach()
	

func detach():
	rigidbody.freeze = false
	isRocketAttached = false
	#car.remove_child(self);
	
signal e
func apply_rocket_boost(boostStrength) -> void:
	if Input.is_action_pressed("LeftMouseButton") and rocketFuel >= 0 and isRocketAttached:
		emit_signal("e")
		var local_z_axis = car.transform.basis.z;
		car.add_constant_force(local_z_axis *boostStrength);
		
		rocketFuel -=1
	else:
		car.constant_force = Vector3(0,0,0);
