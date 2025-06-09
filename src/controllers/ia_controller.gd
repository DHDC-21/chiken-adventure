extends Controller

var direction := 1

func update(character: CharacterBase, delta: float):
	character.velocity.x = direction * character.move_speed
	character.velocity.y += character.gravity * delta
	character.move_and_slide()

	# lógica simples de patrulha
	if is_on_wall():
		direction *= -1

func is_moving() -> bool:
	return true

func is_jumping() -> bool:
	return false
