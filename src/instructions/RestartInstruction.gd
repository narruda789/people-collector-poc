class_name RestartInstruction extends Instruction

var _game_data_path = "res://data/alya.json"

func execute():
	GameData.initialize_from_json(_game_data_path)
	Inventory.clear()

	var message = ""
	message += "\n\n\n\n\n"
	message += GameData.areas["game intro"]
	message += "\n\n..."
	message += "\n\n (!) HINT: Type 'continue' to start the game!\n\n"

	GameData.next_text.append(GameData.areas[GameData.current_area]["intro"])

	return message
