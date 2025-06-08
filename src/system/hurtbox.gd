class_name HurtBox extends Area2D

var parent_node

func _ready() -> void:
	parent_node = self.get_parent()
	


func _on_area_entered(_area:Area2D) -> void:
	if _area != self and parent_node.is_in_group("Player"):
		match _area.name:
			&"EggItem":
				print(parent_node.name, ": peguei o ",String(_area.name))
				get_parent().can_win_level = true
				_area.queue_free()
				var hud_egg = get_tree().current_scene.get_node("Hud/Egg")
				# print(hud_egg)
				if hud_egg:
					hud_egg.modulate = Color(1,1,1,1)

			&"FinalPoint":
				if parent_node.can_win_level == true:
					print(parent_node.name,": *ganhei o level*!")
					_area.animation.play("win_level")
				else:
					print(parent_node.name,": cheguei ao ",String(_area.name))

	elif _area != self and parent_node.is_in_group("Enemy"):
		print(parent_node.name,": entrei na área ",_area.name)

func _on_body_entered(_body:Node2D) -> void:
	if _body != self:
		if _body.is_in_group("Enemy") and parent_node.is_in_group("Player"):
			print(parent_node.name,": colidi com o corpo ",_body.name)
	
