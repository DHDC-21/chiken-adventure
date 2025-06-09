class_name StateMachine extends Node


var character: CharacterBase
var states: Dictionary = {}
var current_state: StateBase = null


func init(character_ref: CharacterBase):
	character = character_ref
	for child in get_children():
		if child is StateBase:
			var key = _normalize_state_name(child.name)
			states[key] = child
			child.init(character, self)
	change_state("idle")

func update(delta):
	if current_state:
		current_state.update(delta)

func change_state(state_name: String):
	var key = state_name.to_lower()
	var state = states.get(key)
	if state == null:
		push_warning("Estado '%s' não encontrado." % state_name)
		return
	if current_state:
		current_state.exit()
	current_state = state
	current_state.enter()

func _normalize_state_name(state_name: String) -> String:
	# Remove o sufixo "state"
	var lower_name = state_name.to_lower()
	if lower_name.ends_with("state"):
		return lower_name.substr(0, lower_name.length() - 5) # remove o "state"
	return lower_name
