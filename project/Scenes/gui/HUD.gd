extends Node2D

signal pause
signal resume

var items = []
var current_item := 1

var scenario_menu = preload("res://Scenes/gui/scenario_menu.tscn")

func _ready():
	$InGameMenu.get_node("quit").pressed.connect(_on_quit_pressed)
	$InGameMenu.get_node("resume").pressed.connect(_on_resume_pressed)
	$InGameMenu.get_node("scenario").pressed.connect(_on_scenario_pressed)
	$RoomMenu.get_node("Room1").pressed.connect(_on_room1_pressed)
	$RoomMenu.get_node("Room2").pressed.connect(_on_room2_pressed)
	

func add_item_image(sprite_path) -> void:
	if current_item == 1:
		$Inventory/Item1.texture = sprite_path
	elif current_item == 2:
		$Inventory/Item2.texture = sprite_path
	elif current_item == 3:
		$Inventory/Item3.texture = sprite_path
	elif current_item == 4:
		$Inventory/Item4.texture = sprite_path
	elif current_item == 5:
		$Inventory/Item5.texture = sprite_path
	else:
		$Inventory/Item6.texture = sprite_path
	current_item += 1


func add_item(item_name, sprite_path) -> void:
	items.append(item_name)
	add_item_image(sprite_path)


func _on_menu_button_pressed():
		owner.pause_room()
		$InGameMenu.visible = true
		$Timer.stop()


func _on_quit_pressed():
	if FileAccess.file_exists("res://Scenes/mini_games/Crossword_Puzzle/saved_puzzle.txt"):
		var dir = DirAccess.open("res://Scenes/mini_games/Crossword_Puzzle/")
		dir.remove("saved_puzzle.txt")
		print("file found")
	get_tree().quit()


func _on_resume_pressed():
	$Timer.start()
	owner.resume_room()
	$InGameMenu.visible = false


func _on_scenario_pressed():
	var scenario_menu_inst = scenario_menu.instantiate()
	add_child(scenario_menu_inst)


func _on_map_button_pressed():
	owner.pause_room()
	$RoomMenu.visible = true
	$Timer.stop()


func _on_room1_pressed():
	owner.enter_room(1)
	$RoomMenu.visible = false
	owner.resume_room()
	$Timer.start()


func _on_room2_pressed():
	owner.enter_room(2)
	$RoomMenu.visible = false
	owner.resume_room()
	$Timer.start()
