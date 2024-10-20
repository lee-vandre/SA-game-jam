extends Node3D

@export var boost :int =10;
@export var car: VehicleBody3D

var rocketFuel := 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
	apply_rocket_boost(boost)
	if Input.is_action_just_pressed("RightMouseButton"):
		detach()
	

func detach():
	car.remove_child(self);
	
func apply_rocket_boost(boostStrength) -> void:
	if Input.is_action_pressed("LeftMouseButton") and rocketFuel >= 0:
		var local_z_axis = car.transform.basis.z;
		car.add_constant_force(local_z_axis *boostStrength);
	else:
		car.constant_force = Vector3(0,0,0);
