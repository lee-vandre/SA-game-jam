extends Node3D


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("nextScene"):
		get_tree().change_scene_to_file("res://level_2_proper.tscn")
