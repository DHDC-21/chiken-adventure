class_name JumpState extends StateBase


var has_double_jumped := false


func enter():
	character.animation.play("jump")
	character.velocity.y = -character.jump_force
	has_double_jumped = false

func update(delta):
	var dir = character.controller.get_direction()
	character.velocity.x = dir * character.move_speed
	handle_gravity(delta)
	character.move_and_slide()

	if character.controller.is_double_jumping() and not has_double_jumped:
		state_machine.change_state("double_jump")
	elif character.velocity.y > 0:
		state_machine.change_state("fall")
