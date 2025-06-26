class_name PlayerController extends Controller


var direction := 0.0
var jump_pressed := false
var double_jump_pressed := false

@export var remote_transform: RemoteTransform2D


func update(_character: CharacterBase, _delta: float):
	direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	jump_pressed = Input.is_action_just_pressed("jump")

func get_direction() -> float:
	return direction

func is_moving() -> bool:
	return direction

func is_jumping() -> bool:
	return jump_pressed

func is_double_jumping() -> bool:
	return jump_pressed

func follow_camera(camera: Camera2D):
	var camera_path = camera.get_path()
	remote_transform.remote_path = camera_path
