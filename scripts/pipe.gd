extends StaticBody2D


onready var right = get_node("right")
onready var camera = utils.get_main_node().get_node("camera")
onready var state = false

func _ready():
	add_to_group(game.GROUP_PIPES)
	set_process_input(true)
	#connect("mouse_entered",self,"_on_mouse_entered")
	
	pass # Replace with function body.
	
#func _input(event):
#	if Input.is_mouse_button_pressed(BUTTON_LEFT):
#		#print(event.position)
#		#print(right.get_global_position().x)
#		#print(right.get_global_position().y)
#		if event.position[0] > right.get_global_position().x:
#			print("got one")
#			if event.position[0] < right.get_global_position().x:
#				print("got two")
#	pass

		
func _process(delta):
	#print(right.get_global_position().y)
	if right.get_global_position().x <= camera.get_total_pos().x:
		queue_free()
	pass
	

func _on_TextureButton_button_up():
	queue_free()
	pass # Replace with function body.
