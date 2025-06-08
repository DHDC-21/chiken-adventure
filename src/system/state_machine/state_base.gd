class_name StateBase extends Node


# referência do node a ser controlado
var controlled_node: Node

# referência da maquina de estados
var state_machine: StateMachine


func start(): pass
func end(): pass

#
func _on_process(_delta): pass
func _on_physics_process(_delta): pass
func _on_input(_event): pass
func _on_unhandled_input(_event): pass
func _on_unhandled_key_input(_event): pass
