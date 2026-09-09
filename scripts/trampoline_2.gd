extends Area2D


@onready var animate: AnimatedSprite2D = $AnimatedSprite2D


func _on_body_entered(body: Node2D) -> void:
	animate.play("open")
	body.velocity.y = randf_range(-800,-850)
	await get_tree().create_timer(0.2).timeout
	animate.play("close")
