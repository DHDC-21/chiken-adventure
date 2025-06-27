class_name RunState extends CharacterStateBase


func on_enter():
	pass

func update(delta):
	character.animation.play("run")
	handle_movement()
	handle_gravity(delta)
	character.move_and_slide()

	if handle_direction() == 0:
		state_machine.change_state("idle")
		return

	elif character.controller.is_jumping() and character.can_jump():
		state_machine.change_state("jump")
		return
		
	elif not character.is_on_floor():
		state_machine.change_state("fall")
		return
