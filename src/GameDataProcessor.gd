class_name GameDataProcessor

var current_area = null

var _game_data_path = "res://data/alya.json"

func _init():
	GameData.load_from_json(_game_data_path)
	Inventory.clear()

func process_action(action, target = null, instruction: Instruction = null):
	if action == InstructionSet.RESTART:
		current_area = null
		# todo: GameData should know how to reset itself
		GameData.set_current_area(null)
		GameData.set_current_poi(null)
		Inventory.clear()

	# If the current area is empty then start with the initial area.
	if current_area == null:
		GameData.load_from_json(_game_data_path)
		current_area = GameData.game_data()[GameData.get_current_area()]
		return render_area(current_area)

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

func render_area(area):
	return area["intro"]
