class_name PlayerController extends Controller


var direction := 0.0
var jump_pressed := false
var double_jump_pressed := false

func update(_character: CharacterBase, _delta: float):
	direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	jump_pressed = Input.is_action_just_pressed("jump")
	double_jump_pressed = Input.is_action_just_pressed("jump")  # pode ter lógica extra se quiser limitar

func get_direction() -> float:
	return direction

func is_moving() -> bool:
	return direction

func is_jumping() -> bool:
	return jump_pressed

func is_double_jumping() -> bool:
	return double_jump_pressed
