extends CharacterBase


@onready var shot_spawn: Marker2D = $ShotSpawn
@onready var shot_direction: RayCast2D = $ShotDirection

func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * _delta

	handle_jump_action(_delta)
	handle_move()
	handle_attack()

	move_and_slide()

func handle_move() -> void:
	var input_move = Input.get_vector("move_left","move_right","move_up","move_down")

	if can_attack == false:
		return

	if input_move.x:
		if input_move.x < 0:
			# move to right
			spritesheet.flip_h = true
			shot_spawn.position.x = 3
			shot_direction.position.x = 5
			shot_direction.rotation_degrees = -90

		if input_move.x > 0:
			# move to left
			spritesheet.flip_h = false
			shot_spawn.position.x = -3
			shot_direction.position.x = -5
			shot_direction.rotation_degrees = 90

		velocity.x = speed * input_move.normalized().x
		animation.play("walk")

	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		animation.play("idle")

func handle_jump_action(_delta: float) -> void:
	var input_jump = Input.is_action_just_pressed("jump")

	if input_jump and is_on_floor():
		can_jump = false
		velocity.y = jump_force

func handle_attack() -> void:
	var input_attack = Input.is_action_just_pressed("attack")

	if input_attack:
		print(self.name, ": *is attacking*")
		can_attack = false;
		#is_attacking = true
		animation.play("attack")

func shot_prefab() -> void:
	var newShot = preload("res://src/entitiles/projectiles/shot_prefab.tscn").instantiate()

	get_tree().current_scene.add_child(newShot)

	newShot.global_position = shot_spawn.global_position

	newShot.set_collision_layer_value(1, false)
	newShot.set_collision_layer_value(3, true)
	newShot.set_collision_mask_value(1, false)
	newShot.set_collision_mask_value(4, true)

	if spritesheet.flip_h:
		print(self.name, ": atirando para direita!")
		newShot.sprite.set_flip_v(true)
		newShot.set_direction(1)
		velocity.x = -knockback * speed
	else:
		print(self.name, ": atirando para esquerda!")
		newShot.sprite.set_flip_v(false)
		newShot.set_direction(-1)
		velocity.x = knockback * speed

func _on_animation_finished(anim_name: StringName) -> void:
	# print(self.name,": animação finalizada!")
	if anim_name == "attack":
		print(self.name,": ataque finalizado.")
		can_attack = true
		#is_attacking = false


func _on_hurt_box_body_entered(_body:Node2D) -> void:
	if _body.name != self.name and _body.is_in_group("Enemy") and can_die:
		print(self.name,": fui acertado pelo ",_body.name)


func _on_hurt_box_area_entered(_area: Area2D) -> void:
	match _area.name:
		&"EggItem":
			print(self.name, ": peguei o ",String(_area.name))
			can_win_level = true
			_area.queue_free()
			var hud_egg = get_tree().current_scene.get_ #node("UI/Hud/Egg")
			hud_egg.modulate = Color(1,1,1,1)

		&"FinalPoint":
			if can_win_level == true:
				print(self.name,": *ganhei o level*!")
				_area.animation.play("win_level")
			else:
				print(self.name,": cheguei ao ",String(_area.name))
