class_name TextParser

var target = null

# Parse a given input string into an instruction.
func parse(text):
	var command_words = text.split(" ", false)

	if (command_words.size() == 0):
		return InstructionSet.NOT_FOUND

	match command_words[0]:
		'examine':
			if (command_words.size() > 1):
				target = command_words[1]
				return InstructionSet.EXAMINE
		'get':
			if (command_words.size() > 1):
				target = command_words[1]
				return InstructionSet.GET
		'inventory':
			return InstructionSet.INVENTORY
		'i':
			return InstructionSet.INVENTORY

		'help':
			return InstructionSet.HELP

		'reset':
			return InstructionSet.RESET

	return InstructionSet.NOT_FOUND

func get_target():
	return target
