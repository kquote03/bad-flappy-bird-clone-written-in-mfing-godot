extends RigidBody2D

var velocity = Vector2(0,0)
export var max_jump = -10
export var gravity_limit = 10
export var jump_velocity = 2000

func _ready():
	gravity_scale = 7.5

func _physics_process(delta):
	linear_velocity.y = clamp(linear_velocity.y,-500,1000)
		
	if Input.is_action_just_pressed("ui_up"):
		apply_impulse(Vector2(),Vector2(0,-jump_velocity))

func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		apply_impulse(Vector2(),Vector2(0,-jump_velocity))

