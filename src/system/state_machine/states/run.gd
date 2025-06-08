class_name RunState extends CharacterStateBase

var move_speed:float:
	set(value):
		move_speed = character_base.move_speed
	get:
		return move_speed

func on_physics_process(delta):	
	character_base.animation.play("run")
	character_base.velocity.x = Input.get_axis("ui_left", "ui_right") * move_speed
	
	handle_gravity(delta)
	character_base.move_and_slide()

func on_input(_event):
	# seria mejor usar el parametro _event para obtener la información del evento
	if Input.is_action_just_pressed("jump"): 
		state_machine.change_to(CharacterStateNames.Jump)
	elif not Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"): 
		state_machine.change_to(CharacterStateNames.Idle)
