extends CharacterBody2D
class_name CharacterBase


@export_category("Resources")
@export var animation: AnimationPlayer
@export var spritesheet: AnimatedSprite2D

@export_category("Variables")
@export var speed: float = 75.0
@export var jump_force: float = -300.0
@export var gravity: float =  200
@export var knockback: int = 1

@export_category("States")
@export var can_jump: bool = true
@export var can_attack: bool = true
@export var can_win_level: bool = false
@export var can_die: bool = true
@export var can_move: bool = false
@export var  is_attacking: bool = false
