class_name GameDataProcessor

var text_parser = null

func _init():
	text_parser = TextParser.new()

func process_action(action, target = null, instruction: Instruction = null):
	if instruction == null:
		match action:
			InstructionSet.EXAMINE:
				instruction = ExamineInstruction.new(target)

			InstructionSet.TAKE:
				instruction = TakeInstruction.new(target)

			InstructionSet.TALK:
				instruction = TalkInstruction.new(target)

			InstructionSet.GO:
				instruction = GoInstruction.new(target)
		
			InstructionSet.INVENTORY:
				instruction = InventoryInstruction.new()

			InstructionSet.MAP:
				instruction = MapInstruction.new()

			InstructionSet.STATS:
				instruction = StatsInstruction.new()

			InstructionSet.CONTINUE:
				instruction = ContinueInstruction.new()
			
			InstructionSet.RESTART:
				instruction = RestartInstruction.new()

			InstructionSet.HELP:
				instruction = HelpInstruction.new()

			InstructionSet.NOT_FOUND:
				instruction = NotFoundInstruction.new()

	# todo: handle null instruction case?
	return instruction.execute()

# todo: test!
func process_command_text(command_text):
	var output_text = _parse_text(command_text)
	if GameData.auto_instruction:
		output_text += _parse_text(GameData.auto_instruction)
		GameData.auto_instruction = ""

	return output_text

func _parse_text(command_text):
	var instruction = text_parser.parse(command_text)
	var output_text = process_action(instruction, text_parser.get_target())
	output_text += "\n\n"
	return output_text
