extends CharacterBody2D


const SPEED = 800.0
const JUMP_VELOCITY = -900.0
const START_POS_X = -622
const START_POS_Y = 294

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func restart():
	#position.x = START_POS_X  # Reset position
	#position.y = START_POS_Y
	position = Vector2(0,0)
	velocity = Vector2.ZERO    # Stop movement


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("colors"):
		print(position)
		restart()
