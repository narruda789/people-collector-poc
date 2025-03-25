class_name TextParser

var _target = null

# Parse a given input string into an instruction.
func parse(text):
	text = text.to_lower()
	var first_word_break = text.find(" ")
	var command_word = text.substr(0, first_word_break)

	match command_word:
		"examine":
			return _set_target_and_return_instruction(text, first_word_break, InstructionSet.EXAMINE)
		"take":
			return _set_target_and_return_instruction(text, first_word_break, InstructionSet.TAKE)
		"inventory", "i":
			return InstructionSet.INVENTORY
		"map", "m":
			return InstructionSet.MAP
		"go", "g":
			return _set_target_and_return_instruction(text, first_word_break, InstructionSet.GO)
		"help":
			return InstructionSet.HELP
		"restart":
			return InstructionSet.RESTART
		"continue", "c":
			return InstructionSet.CONTINUE

	return InstructionSet.NOT_FOUND

func get_target():
	return _target

func _set_target_and_return_instruction(text, first_word_break, instruction):
	if first_word_break == -1:
		return InstructionSet.NOT_FOUND
		
	_target = text.substr(first_word_break, -1).strip_edges()

	var preposition_break = _target.find(" ")
	if _target.substr(0, preposition_break) == "to":
		_target = _target.substr(3, -1).strip_edges()

	return instruction