extends Control


@onready var menu_buttons:= [$MarginContainer/VBoxContainer/BoxContainer/MainButtons/PlayButton, $MarginContainer/VBoxContainer/BoxContainer/MainButtons/ExitButton]
var current_button : int = 0

@onready var selected_button := ColorRect.new()
@export var highlight_color: Color = Color(1,1,0,0.3)

func _ready() -> void:
	selected_button.color = highlight_color
	add_child(selected_button)

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		current_button = (current_button - 1) % menu_buttons.size()

	if Input.is_action_just_pressed("ui_down"):
		current_button = (current_button + 1) % menu_buttons.size()

	selected_button.global_position = menu_buttons[current_button].global_position
	selected_button.size = menu_buttons[current_button].size
	menu_buttons[current_button].grab_focus()

	if Input.is_action_just_pressed("ui_accept"):
		match menu_buttons[current_button].name:
			"PlayButton":
				_on_play_button_pressed()
			"ExitButton":
				_on_exit_button_pressed()

func _on_play_button_pressed() -> void:
	print("Entrando a demo")
	return

func _on_exit_button_pressed() -> void:
	print("Saindo do jogo")
	return
