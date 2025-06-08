extends Node


@export var level_test: bool = true

enum BUTTON {
	Play,
	Options,
	Credits,
	Exit,
}

@export var menu_buttons: Array[Button]
var index_menu_buttons: int = 0
var using_keyboard: bool = false


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if using_keyboard:
		if Input.is_action_just_pressed("ui_up"):
			index_menu_buttons = (index_menu_buttons - 1) % menu_buttons.size()
			menu_buttons[index_menu_buttons].grab_focus()

		elif Input.is_action_just_pressed("ui_down"):
			index_menu_buttons = (index_menu_buttons + 1) % menu_buttons.size()
			menu_buttons[index_menu_buttons].grab_focus()


		if Input.is_action_just_pressed("ui_accept"):
			# print(menu_buttons[index_menu_buttons].name," selecionado!")
			_on_button_pressed(menu_buttons[index_menu_buttons].name)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		using_keyboard = true
	elif event is InputEventMouseButton or event is InputEventScreenTouch:
		using_keyboard = false

func _on_button_pressed(btn: String) -> void:
	print(btn, " acionado!")
	match btn:
		"Play":
			print("Iniciando o level 1")
			if level_test == true:
				get_tree().change_scene_to_file("res://src/maps/level_test.tscn")
			else:
				get_tree().change_scene_to_file("res://src/maps/level_1.tscn")

		"Options":
			print("Abrindo menu de opções")
			GameManager.previous_scene = get_tree().current_scene.scene_file_path
			get_tree().change_scene_to_file("res://src/ui/menu/options_menu.tscn")

		"Credits":
			print("Abrindo a tela de créditos")
			GameManager.previous_scene = get_tree().current_scene.scene_file_path
			get_tree().change_scene_to_file("res://src/ui/menu/credits.tscn")

		"Exit":
			print("Saindo do jogo... obrigado por jogar!")
			get_tree().quit()
