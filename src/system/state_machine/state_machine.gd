class_name StateMachine extends Node


var controlled_node: Node
var states: Dictionary = {}
@export var default_state: StateBase
@export var current_state: StateBase = null
@export var debug: bool = false


func init(node_ref: Node):
	controlled_node = node_ref
	for child in get_children():
		if child is StateBase:
			var key = _normalize_state_name(child.name)
			states[key] = child
			child.init(controlled_node, self)
	current_state = default_state
	change_state(current_state.name)

func update(delta):
	if current_state:
		current_state.update(delta)

func change_state(state_name: String):
	var key = _normalize_state_name(state_name)
	var state = states.get(key)

	if state == null:
		push_warning("Estado '%s' não encontrado.\n" % state_name)
		current_state = default_state
		return

	if current_state:
		current_state.on_exit()
		# if debug: print("Saindo do estado: %s\n"% [current_state.name])

	current_state = state
	_start_state()

func _start_state() -> void:
	if debug: prints("StateMachine", controlled_node.name, "start state", current_state.name)
	# if debug: print("Entrando do estado: %s\n"% [current_state.name])
	current_state.on_enter()

func _normalize_state_name(state_name: String) -> String:
	# 1. Recebe uma String
	# 2. Transforma toda a String para caixa baixa (minusculo)
	var lower_name = state_name.to_lower()

	# 3. Verifica se a string contem underlines "_"
	# 3.1 Caso tenha, remove o(s) underlines da String
	lower_name = lower_name.replace(" ", "").replace("_","")

	# 4. Verifica se a String contém o sufixo "state"
	# 4.1 Caso tenha, remove remove o sufixo "state" da String
	if lower_name.ends_with("state"):
		return lower_name.substr(0, lower_name.length() - 5) # remove o "state"

	return lower_name
