extends CharacterBody2D

@onready var animate_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var start_position = Vector2(100,150)
var jump = 0
var is_dashing = false
var dash_speed = 1000
var dash_time = 0.2
var dash_direction = 1
var dash_no = 1
var is_jumping = false

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if is_on_floor():
		jump = 2
		is_jumping = false
		
	
	if Input.is_action_just_pressed("Jump") and jump>0:
		velocity.y = JUMP_VELOCITY
		jump -= 1
		animate_sprite.play("jump")
		is_jumping = true
		
	


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
		if not is_jumping:
			animate_sprite.play("run")
		dash_direction = 1
		animate_sprite.flip_h = false
	elif velocity.x < -0.1:
		dash_direction = -1
		if not is_jumping:
			animate_sprite.play("run")
		animate_sprite.flip_h = true
	else:
		if not is_jumping:	
			animate_sprite.play("idle")
		
	if Input.is_action_just_pressed("Dash") and not is_dashing and dash_no == 1:
		dash()
		await get_tree().create_timer(1.5).timeout
		dash_no = 1
	if is_dashing:
		velocity.x = dash_direction * dash_speed

	move_and_slide()
	
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider is TileMapLayer:
			var local_pos = collider.to_local(collision.get_position())
			var coords = collider.local_to_map(local_pos)
			var data = collider.get_cell_tile_data(coords)
			if data and data.get_custom_data("is_spike"):
				position = start_position
	
func dash():
	is_dashing = true
	dash_no = 0
	#var direction = Input.get_axis("Left","Right")
	#if direction != 0:
		#dash_direction = direction
	#else:
		#dash_direction = 1
	await get_tree().create_timer(dash_time).timeout
	is_dashing = false
	
		
