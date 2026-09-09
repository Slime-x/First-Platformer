extends Area2D




func _on_body_entered(_body):
	if GameManager.key:
		GameManager.level += 1
		call_deferred("next_level")
		
func next_level():
	get_tree().change_scene_to_file("res://scenes/level_" + str(GameManager.level) + ".tscn")
