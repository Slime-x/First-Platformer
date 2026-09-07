extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var start_position = Vector2(100,150)
var coin = 0
var jump = 0

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
		
	if Input.is_action_just_pressed("Dash"):
		dash()


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

	move_and_slide()
	
func dash():
	velocity.x = 2000
