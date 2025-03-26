class_name RestartInstruction extends Instruction

func _execute() -> String:
	GameData.initialize()
	Inventory.clear()

	var message = ""
	message += "\n\n\n\n\n"
	message += GameData.areas["game intro"]

	GameData.next_text.append(GameData.areas[GameData.current_area]["intro"])

	return message
