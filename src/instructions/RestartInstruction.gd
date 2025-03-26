class_name RestartInstruction extends Instruction

func _execute() -> String:
	GameData.initialize()
	Inventory.clear()

	var message = ""
	message += "\n\n\n\n\n"
	message += GameData.areas["game intro"]
	message += "\n\n..."
	message += "\n\n (!) HINT: Type 'continue' to start the game!\n\n"

	GameData.next_text.append(GameData.areas[GameData.current_area]["intro"])

	return message
