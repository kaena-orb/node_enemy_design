extends CharacterBody2D


const SPEED = 300.0
func _physics_process(delta):
	# As good practice, you should replace UI actions with custom gameplay actions.
	var sides = Input.get_axis("ui_left", "ui_right")
	var topdown = Input.get_axis("ui_up", "ui_down")
	if sides:
		velocity.x = sides * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if topdown:
		velocity.y = topdown * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()