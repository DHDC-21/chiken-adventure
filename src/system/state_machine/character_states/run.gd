class_name RunState extends CharacterStateBase


func on_enter():
	character.animation.play("run")

func update(delta):
	var dir = handle_movement()
	handle_gravity(delta)
	character.move_and_slide()

	if dir == 0:
		state_machine.change_state("idle")
		return
	elif character.controller.is_jumping():
		state_machine.change_state("jump")
		return
	elif not character.is_on_floor():
		state_machine.change_state("fall")
		return
