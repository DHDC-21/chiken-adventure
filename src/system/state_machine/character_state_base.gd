class_name CharacterStateBase extends StateBase


var character: CharacterBase # o nome dessa variável não pode ser "char" porque ja existe uma função no GDScript com esse nome

@export var can_flip: bool = true


func init(node_ref: Node, state_machine_ref: StateMachine):
	controlled_node = node_ref
	if controlled_node is CharacterBase:
		character = controlled_node
	else:
		push_error("controlled_node is not CharacterBase")
		return
	state_machine = state_machine_ref

func handle_gravity(delta):
	character.velocity.y += character.gravity * delta

func handle_flip(dir):
	if dir < 0:
		character.spritesheet.flip_h = true
		return
	else:
		character.spritesheet.flip_h = false
		return

func handle_movement():
	var dir = character.controller.get_direction()
	if can_flip: handle_flip(dir)
	character.velocity.x = dir * character.move_speed
	return dir

