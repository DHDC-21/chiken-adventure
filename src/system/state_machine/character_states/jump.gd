class_name JumpState extends CharacterStateBase


var has_double_jumped := false
@export var can_move: bool = true


func on_enter():
	character.animation.play("jump")
	has_double_jumped = true
	character.do_jump()

func update(delta):
	if can_move: handle_movement()
	handle_gravity(delta)
	character.move_and_slide()

	if character.controller.is_double_jumping() and not has_double_jumped:
		state_machine.change_state("double_jump")
		return
	elif character.velocity.y > 0:
		state_machine.change_state("fall")
		return

func on_exit():
	has_double_jumped = false
