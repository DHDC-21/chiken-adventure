class_name RunState extends StateBase


func enter():
	character.animation.play("run")

func update(delta):
	var dir = character.controller.get_direction()
	if dir < 0:
		character.spritesheet.flip_h = true
	else:
		character.spritesheet.flip_h = false

	character.velocity.x = dir * character.move_speed
	handle_gravity(delta)
	character.move_and_slide()

	if dir == 0:
		state_machine.change_state("walk")
	elif character.controller.is_jumping():
		state_machine.change_state("jump")
	elif not character.is_on_floor():
		state_machine.change_state("fall")
