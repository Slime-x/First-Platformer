extends CharacterBody2D

@onready var animate_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var start_position = Vector2(100,150)
var coin = 0
var jump = 0
var is_dashing = false
var dash_speed = 1000
var dash_time = 0.2
var dash_direction = 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	
	if is_on_floor():
		jump = 2
		
	
	if Input.is_action_just_pressed("Jump") and jump>0:
		velocity.y = JUMP_VELOCITY
		jump -= 1
		
	if Input.is_action_just_pressed("Dash") and not is_dashing:
		dash()
	if is_dashing:
		velocity.x = dash_direction * dash_speed


	# Die when fall of
	if position.y > 1200:
		position = start_position
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if velocity.x > 0.1:
		animate_sprite.play("run")
		dash_direction = 1
		animate_sprite.flip_h = false
	elif velocity.x < -0.1:
		dash_direction = -1
		animate_sprite.play("run")
		animate_sprite.flip_h = true
	else:
		animate_sprite.play("idle")

	move_and_slide()
	
func dash():
	is_dashing = true
	var direction = Input.get_axis("Left","Right")
	if direction != 0:
		dash_direction = direction
	await get_tree().create_timer(2).timeout
	is_dashing = false
	print("Dash")
		
