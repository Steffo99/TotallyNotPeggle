extends RigidBody2D

func _ready():
    pass

func _physics_process(delta):
    var colliding_bodies = self.get_colliding_bodies()
    for colliding_body in colliding_bodies:
        if colliding_body.has_method("on_ball_hit"):
            colliding_body.on_ball_hit()
