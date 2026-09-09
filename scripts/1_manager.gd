extends Node

@onready var key_: Label = $"../Label/KEY_"


func _ready() -> void:
	GameManager.key_label = key_
