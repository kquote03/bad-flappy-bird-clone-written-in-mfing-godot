extends Node2D

var pipe = load("res://Pipes.tscn")
onready var bird = preload("res://Bird.tscn").instance()

var pipeLen:int
var rand_PipeDistUP = -100
var rand_PipeDistDOWN = -100

func _ready():
	bird.connect("body_entered",self,"_on_Bird_body_entered")
	StartGame()
	pass

func StartGame():
	bird.position = Vector2(300,700)
	self.add_child(bird)
	$SpawnTimer.wait_time = 2
	$SpawnTimer.connect("timeout",self,"_on_SpawnTimer_timeout")
	$SpawnTimer.start()

func GameOver():
	self.remove_child(bird)
	$SpawnTimer.stop()
	yield(get_tree().create_timer(2),"timeout")
	StartGame()

func _on_Bird_body_entered(body):
	GameOver()
	print("Game Over")
	##TODO: Replace w/ gameover.

func _on_SpawnTimer_timeout():
	spawnPipes()
	pass

func spawnPipes():
	randomizeLength(0) #For up
	randomizeLength(1) #For down
	randomize()
	var InstancedPipeUP = pipe.instance()
	var InstancedPipeDOWN = pipe.instance()
	InstancedPipeUP.position.x = 800 #outside window
	InstancedPipeDOWN.rotation = PI
	InstancedPipeDOWN.position.x = 800
	#Set the vertical axis for the pipes. don't ask.
	InstancedPipeUP.position.y += rand_PipeDistUP
	InstancedPipeDOWN.position.y += (get_viewport_rect().size.y + rand_PipeDistDOWN)
	#Instance pipes
	self.add_child(InstancedPipeUP)
	self.add_child(InstancedPipeDOWN)

func randomizeLength(ud:bool):
	if ud == false:
		rand_PipeDistUP = rand_range(-450,-100)
#		rand_PipeDistUP = -450
	if ud == true:
		rand_PipeDistDOWN = rand_range(-450,-100)
#		rand_PipeDistDOWN = -50

