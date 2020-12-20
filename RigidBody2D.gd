extends RigidBody2D

export var pipe_speed = 5


func _physics_process(delta):
	position.x -= pipe_speed



