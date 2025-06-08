extends Node2D

func _ready() -> void:
	var virtual_joystick = preload("res://src/ui/virtual_joystick.tscn").instantiate()
	add_child(virtual_joystick)
	
	var hud = preload("res://src/ui/hud.tscn").instantiate()
	add_child(hud)
