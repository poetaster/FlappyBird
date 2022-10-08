#scripts: spawner_bbird
 
extends Node2D
	
const scn_bbird = preload("res://scenes/badbird.tscn")
const PIPE_WIDTH = 26
const GROUND_HEIGHT = 56
const OFFSET_Y = 55
const OFFSET_X = 65
const AMOUNT_TO_FILL_VIEW = 3

func _ready():
	var bird = utils.get_main_node().get_node("bird")
	if (bird):
		bird.connect("state_changed", self, "_on_bird_state_changed", [], CONNECT_ONESHOT)
	pass
	
func _on_bird_state_changed(bird):
	if bird.get_state() == bird.STATE_FLAPPING:
		start()
	pass
	
#func _process(delta):
#	pass

func start():
	spawn_and_move()
	go_init_pos()
	#for i in range(AMOUNT_TO_FILL_VIEW):
	#	spawn_and_move()

func go_init_pos():
	randomize()
	var init_pos = position
	
	init_pos.x  += get_viewport_rect().size.x + PIPE_WIDTH*2
	init_pos.y = rand_range(0 + OFFSET_Y, get_viewport_rect().size.y - GROUND_HEIGHT - OFFSET_Y)
	var camera = utils.get_main_node().get_node("camera")
	if camera:
		init_pos.x += camera.get_total_pos().x
	position = init_pos
	print(position)
	
func spawn_and_move():
	spawn_bbird()
	#go_next_pos()
	pass
	
func spawn_bbird():
	var new_bbird = scn_bbird.instance()
	new_bbird.position = position;
	new_bbird.connect("tree_exited", self, "spawn_and_move")
#	get_node("container").add_child(new_bbird)
	get_node("bbirdcontainer").call_deferred('add_child',new_bbird)
	pass
	
	
func go_next_pos():
	randomize()
	var next_pos = position
	next_pos.x += PIPE_WIDTH/2 + OFFSET_X + PIPE_WIDTH/2
	next_pos.y = rand_range(0 + OFFSET_Y, get_viewport_rect().size.y - GROUND_HEIGHT - OFFSET_Y)
	position = next_pos
	pass
