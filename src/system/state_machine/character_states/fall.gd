class_name FallState extends CharacterStateBase


func on_enter():
	character.animation.play("fall")

func update(delta):
	handle_movement()
	handle_gravity(delta)
	character.move_and_slide()

	if character.controller.is_double_jumping():
		state_machine.change_state("double_jump")
		return
	elif character.is_on_floor():
		character.reset_jumps()
		state_machine.change_state("idle")
		return
