extends CanvasLayer

const GAME_STAGE = "res://stages/game_stage.tscn"
const GAME_STAGE2 = "res://stages/game_stage2.tscn"
const GAME_STAGE3 = "res://stages/game_stage3.tscn"
const MENU_STAGE = "res://stages/main_menu.tscn"

var current_stage = 1
signal stage_changed


func _ready():
	game.connect("score_current_changed", self, "_on_score_current_changed")
	#get_node("amin").connect("animation_finished", self, "_on_animaiton_finished")
	pass

func next_stage():
	
	if current_stage == 1:
		stage_manager.change_stage(stage_manager.GAME_STAGE)
	elif current_stage == 2:
		stage_manager.change_stage(stage_manager.GAME_STAGE2)
	else:
		stage_manager.change_stage(stage_manager.GAME_STAGE3)
		
	pass
	
func change_stage(stage_path):
	#fade to black
	var old_layer = layer
	layer = 5
	get_node("anim").play("fade_in")
	get_node("sfx_swooshing").play()
	yield(get_node("anim"), "animation_finished")
	#change to another stage
	get_tree().change_scene(stage_path)
	layer = old_layer
	emit_signal("stage_changed")
	#fade from black
	#get_node("amin").play("fade_out")
	pass
	
func _on_score_current_changed():
	if current_stage == 1:
		if game.score_current >  45:
			current_stage = 2
			animate_next()
	elif current_stage == 2:
		if game.score_current > 50:
			current_stage = 3
			animate_next()
	elif current_stage == 3:
		if game.score_current > 60:
			#current_stage = 3
			animate_next()
	pass

func animate_next():
	get_node("anim").play("fade_in")
	get_node("sfx_swooshing").play()
	yield(get_node("anim"), "animation_finished")
	get_tree().change_scene('res://stages/game_interstitial.tscn')
	yield(utils.create_timer(5), "timeout")
	stage_manager.next_stage()
	pass
	
