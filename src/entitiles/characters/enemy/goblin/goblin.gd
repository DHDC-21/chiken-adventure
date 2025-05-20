extends CharacterBase


@export_category("Movement Configurations")
@export var destinations: Array[NodePath]
var current_index: int = 0


func _ready() -> void:
	spritesheet = $Sprite
	animation = $Animator

func _physics_process(_delta: float) -> void:
	handle_gravity()
	handle_move(_delta)
	move_and_slide()

func handle_gravity() -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * speed

func handle_move(_delta:float) -> void:
	if destinations.is_empty():
		return

	if destinations.size() == 0 or can_move == false:
		spritesheet.play("idle")
		return
	spritesheet.play("walk")

	var current_destination = get_node(destinations[current_index])

	if self.global_position.x > current_destination.global_position.x:
		spritesheet.flip_h = true
	else:
		spritesheet.flip_h = false

	velocity.x = move_toward(velocity.x, current_destination.position.x, speed * _delta)

	if abs(self.global_position.x - current_destination.global_position.x) < 1.0:
		print(self.name, ": cheguei ao meu destino!")
		current_index = (current_index + 1) % destinations.size()


func _on_animation_finished(_anim_name:StringName) -> void:
	match _anim_name:
		"hurt":
			if can_die: #== true:
				queue_free()
			else:
				print(self.name,": fui atingido!")

