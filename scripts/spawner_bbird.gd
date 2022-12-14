#scripts: spawner_bbird
 
extends Node2D
	
const scn_bbird = preload("res://scenes/badbird.tscn")
const scn_coin = preload("res://scenes/coin_visible.tscn")
const PIPE_WIDTH = 26
var GROUND_HEIGHT = 56
const OFFSET_Y = 15
const OFFSET_X = 65
const AMOUNT_TO_FILL_VIEW = 3

func _ready():
	var bird = utils.get_main_node().get_node("bird")
	var bbird = utils.get_main_node().get_node("badbird")
	if (bird):
		bird.connect("state_changed", self, "_on_bird_state_changed", [], CONNECT_ONESHOT)
	if (bbird):
		print('badbird')
		bbird.connect("state_changed", self, "_on_bird_state_changed", [], CONNECT_ONESHOT)
	pass
	
func _on_bird_state_changed(bird):
	if bird.get_state() == bird.STATE_FLAPPING:
		start()
	pass
	
#func _process(delta):
#	pass

func start():
	spawn_and_move()
	# go_init_pos()
	#for i in range(AMOUNT_TO_FILL_VIEW):
	#	spawn_and_move()

func spawn_and_move():
	go_init_pos()
	spawn_bbird()
	# we spawn the coins here since we want one to one
	# bbird coin ratio. 
	spawn_coin()
	pass
	
func go_init_pos():
	randomize()
	var init_pos = position
	# pos.x   = rand_range(0+16, utils.view_size.width-16)
	init_pos.x  += get_viewport_rect().size.x - 6
	init_pos.y = rand_range(0 + OFFSET_Y, get_viewport_rect().size.y - GROUND_HEIGHT - OFFSET_Y)
	var camera = utils.get_main_node().get_node("camera")
	#if camera:
	#	init_pos.x += camera.get_total_pos().x
	position = init_pos
	#print(position)
	
	
func spawn_bbird():
	var new_bbird = scn_bbird.instance()
	new_bbird.position = position;
	new_bbird.connect("tree_exited", self, "spawn_and_move")
	get_node("bbirdcontainer").call_deferred('add_child',new_bbird)
	pass
	
func spawn_coin():
	var new_coin = scn_coin.instance()
	new_coin.position = position;
	new_coin.connect("tree_exited", self, "spawn_and_move")
	get_node("bbirdcontainer").call_deferred('add_child',new_coin)
	pass
	
