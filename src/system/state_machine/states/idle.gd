class_name IdleState extends StateBase


func enter():
	character.animation.play("idle")

func update(delta):
	if character.controller.is_moving():
		state_machine.change_state("run")
	if character.controller.is_jumping():
		state_machine.change_state("jump")
	handle_gravity(delta)
	character.move_and_slide()
