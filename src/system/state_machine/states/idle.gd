class_name IdleState extends CharacterStateBase


func start():
	character_base.animation.play("idle")

func _on_physics_process(_delta):
	character_base.velocity.x = 0
	handle_gravity(_delta)
	character_base.move_and_slide()
	
func _on_input(_event):
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		state_machine.change_to(CharacterStateNames.Idle)
	if Input.is_action_just_pressed("jump"):
		state_machine.change_to(CharacterStateNames.Jump)
