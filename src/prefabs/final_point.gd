extends Area2D

@onready var sprite := $Sprite as Sprite2D
@onready var animation := $Animation as AnimationPlayer


func _on_animation_finished(_anim_name:StringName) -> void:
    match _anim_name:
        "win_level":
            print("Level concluído!")