extends Node

func _ready():
	pass # Replace with function body.

func get_main_node():
	var root_node = get_tree().get_root()
	
	return root_node.get_child(root_node.get_child_count()-1)

func get_digits(number):
	var str_number = str(number)
	var digits = []
	for i in range(str_number.length()):
		digits.append(str_number[i].to_int())
	return digits
	pass
	
func save(content):
	var file = File.new()
	file.open("user://save_game.dat", File.WRITE)
	file.store_string(content)
	file.close()

func load():
	var file = File.new()
	file.open("user://save_game.dat", File.READ)
	var content = file.get_as_text()
	file.close()
	return content
