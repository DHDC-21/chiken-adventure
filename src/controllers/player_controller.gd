class_name PlayerController extends Controller


var direction := 0.0
var jump_pressed := false
var double_jump_pressed := false

@export var remote_transform: RemoteTransform2D
@export var debug: bool = false


func update(character: CharacterBase, _delta: float):
	direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")

	match character.jumps_left:
		2:	jump_pressed = Input.is_action_just_pressed("jump")
		1:	double_jump_pressed = Input.is_action_just_pressed("jump")

func get_direction() -> float:
	if debug: print("%s direction: %f"%[self.owner.name,direction])
	return direction

func is_moving() -> bool:
	return direction

func is_jumping() -> bool:
	return jump_pressed

func is_double_jumping() -> bool:
	return double_jump_pressed

func follow_camera(camera: Camera2D):
	var camera_path = camera.get_path()
	remote_transform.remote_path = camera_path
