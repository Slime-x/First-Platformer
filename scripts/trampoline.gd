extends Area2D

@onready var double_jump: Label = $"../Label/Double Jump"

@onready var animate: AnimatedSprite2D = $AnimatedSprite2D


func _on_body_entered(body: Node2D) -> void:
	double_jump.text = "BOINK"
	await get_tree().create_timer(0.1).timeout
	animate.play("open")
	body.velocity.y = -1420.0
	await get_tree().create_timer(0.1).timeout
	animate.play("close")
	double_jump.text = ""
