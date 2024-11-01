extends Node3D

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("nextScene"):
		get_tree().change_scene_to_file("res://level_1_proper.tscn")


func _on_area_3d_body_entered(body: Node3D) -> void:
	get_tree().change_scene_to_file("res://gameover.tscn")
	pass # Replace with function body.
