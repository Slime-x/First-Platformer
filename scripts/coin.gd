extends Area2D



func _on_body_entered(body: Node2D) -> void:
	#body.coin += 1
	queue_free()
	GameManager.add_coin()
	
