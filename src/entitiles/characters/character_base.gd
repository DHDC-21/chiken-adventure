class_name CharacterBase extends CharacterBody2D

@export_category("Character Variables")
@export var move_speed: float = 200.0
@export var jump_force: float = 400.0
@export var gravity: float = 1200.0

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
