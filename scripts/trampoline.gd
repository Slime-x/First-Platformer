extends Area2D

@onready var label_2: Label = $"../Control/Label2"
@onready var animate: AnimatedSprite2D = $AnimatedSprite2D


func _on_body_entered(body: Node2D) -> void:
	label_2.text = "BOINK"
	await get_tree().create_timer(0.1).timeout
	animate.play("open")
	body.velocity.y = -1420.0
	await get_tree().create_timer(0.1).timeout
	animate.play("close")
	label_2.text = ""
