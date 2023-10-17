extends CharacterBody2D

enum Direction{
	LEFT,
	RIGHT,
}

var isLooking = Direction.LEFT

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		if direction > 0 and isLooking == Direction.LEFT:
			isLooking = Direction.RIGHT
			$anim_player.flip_h = true
		elif direction < 0 and isLooking == Direction.RIGHT:
			isLooking = Direction.LEFT
			$anim_player.flip_h = false
			
		$anim_player.play("walk")
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$anim_player.play("idle")

	move_and_slide()
