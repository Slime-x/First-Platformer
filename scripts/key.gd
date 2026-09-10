extends Area2D

@onready var key_: Label = $"../Label/KEY_"


func _on_body_entered(_body):
	key_.text = "You have Key!"
	queue_free()
	GameManager.key = true
