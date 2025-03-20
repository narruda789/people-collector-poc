class_name GameDataProcessor

var areas
var currentArea = null

func _init():
	areas = loadJsonData("res://data/game1.json")
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

func process_action(action, target = null):
	# NOT FOUND
	if action == InstructionSet.NOT_FOUND:
		return "Can't do that!\n"

	# HELP
	if action == InstructionSet.HELP:
		var helpText = ''
		helpText += 'HELP:' + "\n"
		helpText += '- Use "examine <item/area>" for more information.' + "\n"
		helpText += '- Use "get <item>" pick up an item.' + "\n"
		helpText += '- Use "reset" to start the game over.' + "\n"
		return helpText

	# RESET
	if action == InstructionSet.RESET:
		currentArea = null
		areas = loadJsonData("res://data/game1.json")
		return process_action(null)

	# If the current area is empty then start with the initial area.
	if currentArea == null:
		currentArea = 'area1'
		return render_area(areas[currentArea])

	# EXAMINE
	if action == InstructionSet.EXAMINE:
		var instruction = ExamineInstruction.new()
		return instruction.execute()

	# GET
	if action == InstructionSet.GET and target != null:
		if target in areas[currentArea]['items'].keys():
			var new_item = Item.new(areas[currentArea]['items'][target]['displayName'])
			Inventory.add(new_item)
			areas[currentArea]['items'].erase(target)
			return 'You get the ' + new_item._name;

		return 'There is no ' + target + "\n"

	# INVENTORY
	if action == InstructionSet.INVENTORY:
		var instruction = InventoryInstruction.new()
		return instruction.execute()

# Render a given area, including the exits.
func render_area(area):
	var renderedArea = ''
	renderedArea += area['intro'] + "\n"

	if area.has('items') == true:
		for item in area['items']:
			renderedArea += area['items'][item]['inRoom'] + "\n"

	return renderedArea
