class_name PlayerController extends Node

'''
signal move_right
signal move_left
signal jump

func _input(_event):
	if Input.is_action_just_pressed("move_right"):
		emit_signal("move_right")
	if Input.is_action_just_pressed("move_left"):
		emit_signal("move_left")
	if Input.is_action_just_pressed("jump"):
		emit_signal("jump")
'''

@onready var controlled_player:= self.owner

func _physics_process(_delta: float) -> void:
	if controlled_player:
		pass
