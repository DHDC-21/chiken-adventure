class_name StateMachine extends Node


var controlled_node: Node
var states: Dictionary = {}
@export var default_state: StateBase
@export var current_state: StateBase = null
@export var debug: bool = false


func _ready() -> void:
	current_state = default_state

func init(node_ref: Node):
	controlled_node = node_ref
	for child in get_children():
		if child is StateBase:
			var key = _normalize_state_name(child.name)
			states[key] = child
			child.init(controlled_node, self)
	var current_state_name = current_state.name
	change_state(current_state_name)

func update(delta):
	if current_state:
		current_state.update(delta)

func change_state(state_name: String):
	var key = state_name.to_lower()
	var state = states.get(key)

	if state == null:
		push_warning("Estado '%s' não encontrado.\n" % state_name)
		current_state = default_state
		return

	if current_state:
		current_state.on_exit()
		if debug: print("Saindo do estado: %s\n"% [current_state.name])

	current_state = state

	current_state.on_enter()
	if debug: print("Entrando do estado: %s\n"% [current_state.name])

func _normalize_state_name(state_name: String) -> String:
	# Essa função remove o sufixo "state"
	var lower_name = state_name.to_lower()
	if lower_name.ends_with("state"):
		return lower_name.substr(0, lower_name.length() - 5) # remove o "state"
	return lower_name
