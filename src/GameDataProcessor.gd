class_name GameDataProcessor

func process_action(action, target = null, instruction: Instruction = null):
	if instruction == null:
		match action:
			InstructionSet.RESTART:
				instruction = RestartInstruction.new()
			
			InstructionSet.HELP:
				instruction = HelpInstruction.new()

			InstructionSet.EXAMINE:
				instruction = ExamineInstruction.new(target)

			InstructionSet.TAKE:
				instruction = TakeInstruction.new(target)

			InstructionSet.INVENTORY:
				instruction = InventoryInstruction.new()

			InstructionSet.MAP:
				instruction = MapInstruction.new()

			InstructionSet.GO:
				instruction = GoInstruction.new(target)
		
			InstructionSet.NOT_FOUND:
				instruction = NotFoundInstruction.new()

	# todo: handle null instruction case?
	return instruction.execute()

