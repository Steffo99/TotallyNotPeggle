extends Node2D

onready var ball = preload("res://nodes/Ball.tscn")

var force
var turn_rate
var ball_available

func _ready():
    self.force = 500
    self.turn_rate = PI/4
    self.ball_available = true
    
func _process(delta):
    if Input.is_action_pressed("aim_clockwise"):
        self.rotate(-turn_rate * delta)
    elif Input.is_action_pressed("aim_counterclockwise"):
        self.rotate(turn_rate * delta)

func _input(event):
    if event.is_action_pressed("drop_ball"):
        spawn_ball(Vector2.ZERO, self.force, -self.rotation)

func spawn_ball(at_position, with_force, with_force_angle):
    var created = ball.instance()
    self.add_child(created)
    created.position = at_position
    created.apply_impulse(Vector2.ZERO, Vector2(sin(with_force_angle) * with_force, cos(with_force_angle) * with_force))
    self.ball_available = false
    
func return_ball():
    self.ball_available = true