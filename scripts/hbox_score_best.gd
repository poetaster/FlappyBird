extends HBoxContainer

const sprite_number = [
	preload("res://sprites/number_middle_0.png"),
	preload("res://sprites/number_middle_1.png"),
	preload("res://sprites/number_middle_2.png"),
	preload("res://sprites/number_middle_3.png"),
	preload("res://sprites/number_middle_4.png"),
	preload("res://sprites/number_middle_5.png"),
	preload("res://sprites/number_middle_6.png"),
	preload("res://sprites/number_middle_7.png"),
	preload("res://sprites/number_middle_8.png"),
	preload("res://sprites/number_middle_9.png")
]
var player

func _ready():
	var player
	player = load_data('user://player.res')
	if player.high_score > game.score_best:
		game.score_best = player.high_score
	game.connect("score_best_changed", self, "_on_score_best_changed")
	set_number(game.score_best)
	pass	
	
func _on_score_best_changed():
	var player
	player = load_data('user://player.res')
	if player.high_score > game.score_best:
		game.score.best = player.high_score
	else:
		save_score()
	set_number(game.score_best)
	pass
	
func set_number(num):
	for child in get_children():
		child.free()
	for digit in utils.get_digits(num):
		var texture_rect = TextureRect.new()
		texture_rect.set_texture(sprite_number[digit])
		add_child(texture_rect)
	pass

func save_score():
			# we save state on this transition	
		var player = load_data('user://player.res')
		if game.score_best > player.high_score:
			player.high_score = game.score_best
			var result = ResourceSaver.save('user://player.res', player)
			#print(result)
			assert(result == OK)

func load_data(file_name):
	if ResourceLoader.exists(file_name):
		var player = ResourceLoader.load(file_name)
		if player is Player: # Check that the data is valid
			return player
	else:
		#print("now")
		return Player.new()
