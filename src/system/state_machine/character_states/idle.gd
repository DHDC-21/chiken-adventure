class_name IdleState extends CharacterStateBase


func on_enter():
	character.animation.play("idle")

func update(delta):
	if character.controller.is_moving():
		if state_machine.states.get(state_machine._normalize_state_name("walk")):
			state_machine.change_state("walk")
			return

		elif state_machine.states.get(state_machine._normalize_state_name("run")):
			state_machine.change_state("run")
			return

	elif character.controller.is_jumping():
		state_machine.change_state("jump")
		return

	handle_movement()
	handle_gravity(delta)
	character.move_and_slide()
