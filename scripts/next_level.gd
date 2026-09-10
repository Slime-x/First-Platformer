extends Area2D

@onready var key_: Label = $"../Label/KEY_"

func _ready() -> void:
	if not GameManager.key:
		key_.text = "You need a key!"

func _on_body_entered(_body):
	if GameManager.key:
		key_.text = "CONGRATULATIONS!!! YOU WON"
	
