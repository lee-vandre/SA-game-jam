extends Node3D


func _on_area_3d_body_entered(body: Node3D) -> void:
	print("ahhhujhhhhadsgviuadg")
	get_tree().change_scene_to_file("res://level_2_practice_arena.tscn")
	pass # Replace with function body.


func _on_area_3d_2_body_entered(body: Node3D) -> void:
	get_tree().change_scene_to_file("res://gameover.tscn")
	pass # Replace with function body.