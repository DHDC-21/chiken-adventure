class_name FallState extends StateBase


func enter():
	character.animation.play("fall")

func update(delta):
	var dir = character.controller.get_direction()
	character.velocity.x = dir * character.move_speed
	handle_gravity(delta)
	character.move_and_slide()

	if character.controller.is_double_jumping():
		state_machine.change_state("double_jump")
	elif character.is_on_floor():
		state_machine.change_state("idle")
