class_name WalkState extends CharacterStateBase


func on_enter() -> void:
	character.animation.play("walk")

func update(delta):
	var dir = handle_movement()
	handle_gravity(delta)
	character.move_and_slide()

	if abs(dir) > 0.8:
		state_machine.change_state("run")
		return
	elif dir == 0:
		state_machine.change_state("idle")
		return
	elif character.controller.is_jumping():
		state_machine.change_state("jump")
		return
	elif not character.is_on_floor():
		state_machine.change_state("fall")
		return
