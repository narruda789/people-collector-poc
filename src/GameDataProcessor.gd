class_name GameDataProcessor

# todo: make areas a singleton rather than passing chunks of it around
# var areas
var current_area = null
var current_poi = null

var _game_data_path = "res://data/alya.json"

func _init():
	GameData.load_from_json(_game_data_path)
	Inventory.clear()

func process_action(action, target = null, instruction: Instruction = null):
	if action == InstructionSet.RESTART:
		current_area = null
		current_poi = null
		Inventory.clear()
		GameData.load_from_json(_game_data_path)

	# If the current area is empty then start with the initial area.
	if current_area == null:
		current_area = GameData.get_data()["alya's room"]
		return render_area(current_area)

	match action:
		InstructionSet.HELP:
			if instruction == null:
				instruction = HelpInstruction.new()

		InstructionSet.EXAMINE:
			if instruction == null:
				instruction = ExamineInstruction.new(target, current_area)
			current_poi = target

		InstructionSet.TAKE:
			if instruction == null:
				instruction = TakeInstruction.new(target, current_area, current_poi)

		InstructionSet.INVENTORY:
			if instruction == null:
				instruction = InventoryInstruction.new()

		InstructionSet.MAP:
			if instruction == null:
				instruction = MapInstruction.new(GameData.get_data(), current_area)
	
		InstructionSet.NOT_FOUND:
			if instruction == null:
				instruction = NotFoundInstruction.new()

	# todo: handle null instruction case?
	return instruction.execute()

func render_area(area):
	return area["intro"]
