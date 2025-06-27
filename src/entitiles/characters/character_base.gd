class_name CharacterBase extends CharacterBody2D

@export_category("Character Variables")
@export var move_speed: float = 200.0
@export var jump_force: float = 400.0
var jumps_left: int = 2
@export var max_jumps: int = 2
@export var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

@export_category("Character Elements")
@export var state_machine: StateMachine
@export var controller: Controller
@export var animation: AnimationPlayer
@export var spritesheet: AnimatedSprite2D

func _ready() -> void:
	state_machine.init(self)

func _physics_process(delta: float) -> void:
	controller.update(self, delta)
	state_machine.update(delta)

func reset_jumps() -> void:
	jumps_left = max_jumps

func can_jump() -> bool:
	return jumps_left > 0

func do_jump() -> void:
	if can_jump():
		velocity.y = -jump_force
		jumps_left -=1
