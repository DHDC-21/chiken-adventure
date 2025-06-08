class_name StateMachine extends Node


@onready var  controlled_node = self.owner

@export var default_state: StateBase

var current_state: StateBase = null


func _ready() -> void:
	call_deferred("_state_default_start")

# _start_default_state
func _state_default_start() -> void:
	current_state = default_state
	_state_start()

# _start_state
func _state_start() -> void:
	prints("StateMachine", controlled_node.name, "start state", current_state.name)
	current_state.controlled_node = controlled_node
	current_state.state_machine = self
	current_state.start()

func change_to(new_state: String) -> void:
	var new_state_node = get_node_or_null(new_state)
	if not new_state_node:
		push_error("Estado não encontrado: " + new_state)
		return

	if current_state and current_state.has_method("end"):
		current_state.end()

	current_state = get_node(new_state)
	_state_start()


func _process(delta: float) -> void:
	if current_state and current_state.has_method("_on_process"):
		current_state._on_process(delta)

func _physics_process(delta: float) -> void:
	if current_state and current_state.has_method("_on_physics_process"):
		current_state._on_physics_process(delta)

func _input(event: InputEvent) -> void:
	if current_state and current_state.has_method("_on_input"):
		current_state._on_input(event)

func _unhandled_input(event: InputEvent) -> void:
	if current_state and current_state.has_method("_on_unhandled_input"):
		current_state._on_unhandled_input(event)

func _unhandled_key_input(event: InputEvent) -> void:
	if current_state and current_state.has_method("_on_unhandled_key_input"):
		current_state._on_unhandled_key_input(event)
