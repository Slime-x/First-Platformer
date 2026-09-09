extends Area2D


	

func _on_body_entered(body: Node2D) -> void:
	body.position = body.start_position
