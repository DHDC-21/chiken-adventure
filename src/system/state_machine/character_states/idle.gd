class_name IdleState extends CharacterStateBase


func on_enter():
	character.animation.play("idle")
	handle_movement()

func update(delta):
	handle_gravity(delta)
	character.move_and_slide()

	if character.controller.is_moving():
		if state_machine.states.get(state_machine._normalize_state_name("walk")):
			state_machine.change_state("walk")
			return

		elif state_machine.states.get(state_machine._normalize_state_name("run")):
			state_machine.change_state("run")
			return

	elif character.controller.is_jumping() and character.can_jump():
		state_machine.change_state("jump")
		return
