class_name DoubleJumpState extends CharacterStateBase


@export var can_move: bool = true

func on_enter():
	character.animation.play("double_jump")
	character.do_jump()

func update(delta):
	if can_move: handle_movement()
	handle_gravity(delta)
	character.move_and_slide()

	if character.velocity.y > 0:
		state_machine.change_state("fall")
		return

