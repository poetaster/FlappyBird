extends CanvasLayer

const GAME_STAGE = "res://stages/game_stage.tscn"
const GAME_STAGE2 = "res://stages/game_stage2.tscn"
const MENU_STAGE = "res://stages/main_menu.tscn"

var current_stage = 0
signal stage_changed


func _ready():
	game.connect("score_current_changed", self, "_on_score_current_changed")
	#get_node("amin").connect("animation_finished", self, "_on_animaiton_finished")
	pass

func next_stage():
	print(current_stage)
	if current_stage == 0:
		stage_manager.change_stage(stage_manager.GAME_STAGE)
	else:
		stage_manager.change_stage(stage_manager.GAME_STAGE2)
		
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
	print(current_stage)

	#fade from black
	#get_node("amin").play("fade_out")
	pass
	
func _on_score_current_changed():
	if game.score_current > 5:
		print(current_stage)
		if current_stage < 2:
			current_stage = current_stage + 1
			
		stage_manager.next_stage()
	pass
