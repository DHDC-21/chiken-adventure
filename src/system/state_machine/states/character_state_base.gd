class_name CharacterStateBase extends StateBase

var character_base: CharacterBase:
	set(value):
		controlled_node = value
	get:
		return controlled_node

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

func handle_gravity(delta):
	character_base.velocity.y += gravity * delta
