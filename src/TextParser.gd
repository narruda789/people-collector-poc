class_name TextParser

func parse_auto_command(json) -> Instruction:
	return NotFoundInstruction.new()

func parse_user_command(user_input) -> Instruction:
	user_input = user_input.to_lower()
	var first_word_break = user_input.find(" ")
	var command_word = user_input.substr(0, first_word_break)

	match command_word:
		"examine":
			return ExamineInstruction.new(_get_target(user_input, first_word_break))
		"take":
			return TakeInstruction.new(_get_target(user_input, first_word_break))
		"talk":
			return TalkInstruction.new(_get_target(user_input, first_word_break))
		"go", "g":
			return GoInstruction.new(_get_target(user_input, first_word_break))
		"inventory", "i":
			return InventoryInstruction.new()
		"map", "m":
			return MapInstruction.new()
		"stats", "s":
			return StatsInstruction.new()
		"continue", "c":
			return ContinueInstruction.new()
		"restart":
			return RestartInstruction.new()
		"help":
			return HelpInstruction.new()

	return NotFoundInstruction.new()

func _get_target(text, first_word_break):
	if first_word_break == -1:
		return NotFoundInstruction.new()
		
	var target = text.substr(first_word_break, -1).strip_edges()

	var preposition_break = target.find(" ")
	if target.substr(0, preposition_break) == "to":
		target = target.substr(3, -1).strip_edges()

	target = target.replace("é", "e")

	return target
