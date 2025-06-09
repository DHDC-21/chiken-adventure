class_name StateBase extends Node


var character: CharacterBase
var state_machine: StateMachine

func init(character_ref: CharacterBase, state_machine_ref: StateMachine):
	character = character_ref
	state_machine = state_machine_ref

func enter():
	pass

func exit():
	pass

func update(_delta):
	pass

func handle_gravity(delta):
	character.velocity.y += character.gravity * delta
