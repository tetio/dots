extends Node

const MAX_WIDTH = 500
const MAX_HEIGHT = 500
const pre_purple_ball_factory = preload("res://factories/PurpleBall.tscn")
var balls = []
var hidden_balls = []
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var pb_factory = pre_purple_ball_factory.instance()
	balls.append(create_ball(pb_factory));
	balls.append(create_ball(pb_factory));
	balls.append(create_ball(pb_factory));
	balls.append(create_ball(pb_factory));
	balls.append(create_ball(pb_factory));

func create_ball(factory):
	var ball = factory.duplicate()
	ball.position = Vector2(round(randf()*MAX_WIDTH), round(randf()*MAX_HEIGHT))
	add_child(ball)
	return ball

func _process(delta):
	if hidden_balls.size() > 3:
		var ball = hidden_balls[0]
		ball.position = Vector2(round(randf()*MAX_WIDTH), round(randf()*MAX_HEIGHT))
		balls.append(ball)
		hidden_balls.remove(0)
		ball._ready()
		ball.show()
	if balls.size() > 0:
		var i = 0
		var ball_removed = false
		while i < balls.size() and not ball_removed:
			var ball = balls[i]
			if ball.is_dead():
				ball.hide()
				#ball.queue_free()
				print("removed ball number %s" % [i])
				balls.remove(i)
				hidden_balls.append(ball)
				ball_removed = true
			i += 1
				
