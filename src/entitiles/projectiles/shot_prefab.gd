extends Area2D

var sprite: Sprite2D
var speed: float = 300
var direction := 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite = $Sprite

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed * direction * delta

func  set_direction(_direction) -> void:
	direction = _direction

func _on_screen_exited() -> void:
	queue_free()


func _on_body_entered(_body:Node2D) -> void:
	# print(_body.name)
	if _body.is_in_group("Enemy"):
		_body.animation.play("hurt")
		queue_free()
