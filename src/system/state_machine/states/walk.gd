class_name WalkState extends StateBase


func enter() -> void:
	character.animation.play("walk")

func update(delta):
	var dir = character.controller.get_direction()
	character.velocity.x = dir * (character.move_speed * 0.5)
	handle_gravity(delta)
	character.move_and_slide()

	if abs(dir) > 0.8:
		state_machine.change_state("run")
	elif dir == 0:
		state_machine.change_state("idle")
	elif character.controller.is_jumping():
		state_machine.change_state("jump")
	elif not character.is_on_floor():
		state_machine.change_state("fall")
