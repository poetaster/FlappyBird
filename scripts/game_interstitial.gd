extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("hud/con_instruciton/anim").play("show")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
