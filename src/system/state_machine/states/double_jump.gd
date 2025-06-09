class_name DoubleJumpState extends StateBase

func enter():
	character.animation.play("double_jump")
	character.velocity.y = -character.jump_force * 0.9

func update(delta):
	var dir = character.controller.get_direction()
	character.velocity.x = dir * character.move_speed
	handle_gravity(delta)
	character.move_and_slide()

	if character.velocity.y > 0:
		state_machine.change_state("fall")


