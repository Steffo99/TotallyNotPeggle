extends StaticBody2D

onready var hit_sprite = preload("res://sprites/orangepegactive.png")

var object_type = "Peg"

var hit

func _ready():
    hit = false

func on_ball_hit():
    hit = true
    $Sprite.set_texture(hit_sprite)
