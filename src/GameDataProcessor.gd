class_name GameDataProcessor

var _game_start = true

var _game_data_path = "res://data/alya.json"

func _init():
	_initialize()

func process_action(action, target = null, instruction: Instruction = null):
	if action == InstructionSet.RESTART:
		_game_start = true

	# If the current area is empty then start with the initial area.
	if _game_start:
		_initialize()
		_game_start = false
		return GameData.areas[GameData.current_area]["intro"]

	match action:
		InstructionSet.HELP:
			if instruction == null:
				instruction = HelpInstruction.new()

		InstructionSet.EXAMINE:
			if instruction == null:
				instruction = ExamineInstruction.new(target)

		InstructionSet.TAKE:
			if instruction == null:
				instruction = TakeInstruction.new(target)

		InstructionSet.INVENTORY:
			if instruction == null:
				instruction = InventoryInstruction.new()

		InstructionSet.MAP:
			if instruction == null:
				instruction = MapInstruction.new()
	
		InstructionSet.NOT_FOUND:
			if instruction == null:
				instruction = NotFoundInstruction.new()

	# todo: handle null instruction case?
	return instruction.execute()

func _initialize():
	GameData.initialize_from_json(_game_data_path)
	Inventory.clear()