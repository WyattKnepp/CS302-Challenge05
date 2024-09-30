extends Area2D

@export var speed = 400
@export var jump_initial_velocity = 400
@export var gravitational_acceleration = 800
var y_velocity = 0
var screen_size 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = speed*-1
	if Input.is_action_pressed("jump"):
		y_velocity = -jump_initial_velocity
	

	y_velocity = y_velocity + delta*gravitational_acceleration
		
	velocity.y = y_velocity
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
