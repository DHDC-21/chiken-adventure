class_name CharacterStateBase extends StateBase


var character: CharacterBase: # o nome dessa variável não pode ser "char" porque ja existe uma função no GDScript com esse nome
	set(value):
		if controlled_node is CharacterBase:
			controlled_node = value
		else:
			push_error("controlled_node is not CharacterBase")
			return
	get:
		return controlled_node


@export var can_flip: bool = true


func handle_gravity(delta):
	character.velocity.y += character.gravity * delta


func  handle_direction() -> float:
	return character.controller.get_direction()

func handle_flip(dir):
	if can_flip:
		if dir < 0:
			character.spritesheet.flip_h = true
			return
		elif dir > 0:
			character.spritesheet.flip_h = false
			return

func handle_movement():
	var dir = handle_direction()
	handle_flip(dir)
	character.velocity.x = dir * character.move_speed
