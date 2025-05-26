class_name CharacterBase extends CharacterBody2D


@export_category("States")
@export var can_jump: bool = true
@export var can_attack: bool = true
@export var can_win_level: bool = false
@export var can_die: bool = true
@export var can_move: bool = true
@export var  is_attacking: bool = false

@export_category("Movement Variables")
@export var speed: float = 75.0
@export var jump_force: float = -300.0
@export var gravity: float =  200
@export var knockback: int = 1

@export_category("Resources")
@export var animation: AnimationPlayer
@export var spritesheet: AnimatedSprite2D


func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	handle_gravity(_delta)

func handle_gravity(_delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * _delta
