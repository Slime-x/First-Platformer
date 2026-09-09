extends Area2D



func _on_body_entered(_body):
	queue_free()
	GameManager.add_coin()
	
