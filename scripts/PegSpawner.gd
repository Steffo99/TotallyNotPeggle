extends Node2D

onready var peg = preload("res://nodes/Peg.tscn")

var h_distance = 60
var v_distance = 40

var rows = 15
var columns = 50
    
func _ready():
    for row in range(rows):
        for column in range(columns):
            var offset = 0
            if row % 2:
                offset += h_distance / 2
            spawn_peg(Vector2(column * h_distance + offset, row * v_distance))

func spawn_peg(pos):
    var created = peg.instance()
    self.add_child(created)
    created.position = pos
