extends CharacterBody2D

@export_category("Resources")
@export var animation: AnimationPlayer
@export var spritesheet: AnimatedSprite2D
@onready var shot_spawn: Marker2D = $ShotSpawn
@onready var shot_direction: RayCast2D = $ShotDirection

@export_category("Variables")
@export var speed: float = 0.7
@export var jump_force: float = -100.0
@export var gravity: float =  200
 
@export_category("States")
@export var can_jump: bool = true
@export var can_attack: bool = true

@export var  is_attacking: bool = false


func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	velocity.y += gravity * _delta
	
	handle_jump_action(_delta)
	handle_move()
	handle_attack()
	
	move_and_slide()

func handle_move() -> void:
	var input_move = Input.get_vector("move_left","move_right","move_up","move_down")
	
	if can_attack == false:
		return
			
	if input_move.x:
		if input_move.x < 0:
			# move to right
			spritesheet.flip_h = true
			shot_spawn.position.x = 3
			shot_direction.position.x = 5
			shot_direction.rotation_degrees = -90
			
		if input_move.x > 0:
			# move to left
			spritesheet.flip_h = false
			shot_spawn.position.x = -3
			shot_direction.position.x = -5
			shot_direction.rotation_degrees = 90
		
		velocity.x += speed * input_move.normalized().x
		animation.play("walk")
		
	else:
		velocity.x = 0
		animation.play("idle")

func handle_jump_action(_delta: float) -> void: 
	var input_jump = Input.is_action_just_pressed("jump")
	
	if input_jump and is_on_floor():
		can_jump = false
		velocity.y += jump_force

func handle_attack() -> void:
	var input_attack = Input.is_action_just_pressed("attack")
	
	if input_attack:
		print("is attacking")
		can_attack = false;
		#is_attacking = true
		animation.play("attack")

func shot_prefab() -> void:
	#print("atirando!")
	var newShot = preload("res://src/prefabs/shot_prefab.tscn").instantiate()
	
	add_child(newShot)
	
	newShot.global_position = shot_spawn.global_position
	
	newShot.set_collision_layer_value(1, false)
	newShot.set_collision_layer_value(3, true)
	newShot.set_collision_mask_value(1, false)
	newShot.set_collision_mask_value(4, true)
	
	if spritesheet.flip_h:
		print("Atirando para diretia")
		newShot.sprite.set_flip_v(true)
		newShot.set_direction(1)
		velocity.x = -50 * speed
	else:
		print("Atirando para esquerda")
		newShot.sprite.set_flip_v(false)
		newShot.set_direction(-1)
		velocity.x = 50 * speed

func _on_animation_finished(anim_name: StringName) -> void:
	#print("Animação finalizada")
	if anim_name == "attack":
		print("Ataque finalizado")
		can_attack = true
		#is_attacking = false
