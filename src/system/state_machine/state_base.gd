class_name StateBase extends Node

var controlled_node: Node
var state_machine: StateMachine


func init(node_ref: Node, state_machine_ref: StateMachine):
	controlled_node = node_ref
	state_machine = state_machine_ref

func on_enter():
	pass

func update(_delta):
	pass

func on_exit():
	pass
