class_name GameDataProcessor

# todo: make areas a singleton rather than passing chunks of it around
var areas
var current_area = null
var current_poi = null

func _init():
	areas = loadJsonData("res://data/alya.json")
	Inventory.clear()

# Load the game data from the json file.
func loadJsonData(fileName):
	var file = FileAccess.open(fileName, FileAccess.READ)
	var json_string = file.get_as_text()
	file.close()

	var json = JSON.new()
	var error = json.parse(json_string)
	if error == OK:
		var data_received = json.data
		if typeof(data_received) == TYPE_DICTIONARY:
			return data_received
		else:
			assert(false, "Unexpected data in JSON output")
	else:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
		assert(false, "JSON Parse Error")

func process_action(action, target = null, instruction: Instruction = null):
	# NOT FOUND
	if action == InstructionSet.NOT_FOUND:
		return "Can't do that!"

	# HELP
	if action == InstructionSet.HELP:
		var helpText = "HELP:"
		helpText += "\n  examine <target> | Get more information about a target"
		helpText += "\n  take <item>      | Pick up an item"
		helpText += "\n  [lb]i[rb]nventory      | See all the items Alya is carrying"
		helpText += "\n  [lb]m[rb]ap            | View a map of the area"
		helpText += "\n  "
		helpText += "\n  restart          | Restart game from the beginning"
		helpText += "\n  help             | Open this help menu"

		return helpText

	# RESTART
	if action == InstructionSet.RESTART:
		current_area = null
		current_poi = null
		Inventory.clear()
		areas = loadJsonData("res://data/alya.json")
		return process_action(null)

	# If the current area is empty then start with the initial area.
	if current_area == null:
		current_area = areas["alya's room"]
		return render_area(current_area)

	# EXAMINE
	if action == InstructionSet.EXAMINE:
		if instruction == null:
			instruction = ExamineInstruction.new(target, current_area)
		current_poi = target

	# TAKE
	if action == InstructionSet.TAKE:
		if instruction == null:
			instruction = TakeInstruction.new(target, current_area, current_poi)

	# INVENTORY
	if action == InstructionSet.INVENTORY:
		if instruction == null:
			instruction = InventoryInstruction.new()

	# MAP
	if action == InstructionSet.MAP:
		if instruction == null:
			instruction = MapInstruction.new(areas, current_area)
	
	return instruction.execute()

func render_area(area):
	return area["intro"]
