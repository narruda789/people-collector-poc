class_name GameDataProcessor

var InstructionSet = load("res://src/InstructionSet.gd")

var rooms
var currentRoom = null
var inventory = {}

func _init():
	rooms = loadJsonData("res://data/game1.json")
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

func process_action(action, object = null):
	# HELP
	if action == InstructionSet.HELP:
		var helpText = ''
		helpText += 'Instructions:' + "\n"
		helpText += '- Use "look" around the room you are in.' + "\n"
		helpText += '- Use "north", "south", "east", "west" to move in that direction.' + "\n"
		helpText += '- Use "get <object>" pick up objects.' + "\n"
		helpText += '- Use "reset" to start the game over.' + "\n"
		return helpText

	# RESET
	if action == InstructionSet.RESET:
		currentRoom = null
		inventory = {}
		rooms = loadJsonData("res://data/game1.json")
		return process_action(null)

	# If the current room is empty then start with the initial room.
	if currentRoom == null:
		currentRoom = 'room1'
		return render_room(rooms[currentRoom])

	# LOOK
	if action == InstructionSet.LOOK:
		return render_room(rooms[currentRoom])

	# GET
	if action == InstructionSet.GET and object != null:
		for item in rooms[currentRoom]['items']:
			if rooms[currentRoom]['items'][item]['name'] == object:
				Inventory.add(Item.new(rooms[currentRoom]['items'][item]['name']))
				return 'You get the ' + object;
		return 'There is no ' + object + "\n"

	# INVENTORY
	if action == InstructionSet.INVENTORY:
		var instruction = InventoryInstruction.new()
		return instruction.execute()

	# If we get to this point we have a direction of some kind.
	# Is direction/action valid?
	if rooms[currentRoom]['exits'].has(action) == false:
		return 'I don\'t understand!' + "\n"

	# is a direction then change the state to the new room.
	if rooms[currentRoom]['exits'][action].has('destination') == true:
		currentRoom = rooms[currentRoom]['exits'][action]['destination']

	# return the text of the new room
	return render_room(rooms[currentRoom])

# Render a given room, including the exits.
func render_room(room):
	var renderedRoom = ''
	renderedRoom += room['intro'] + "\n"

	if room.has('items') == true:
		for item in room['items']:
			if inventory.has(item) == false:
				renderedRoom += room['items'][item]['description'] + "\n"

	renderedRoom += "\nPossible exits are:\n"

	for exit in room['exits']:
		renderedRoom += "- " + room['exits'][exit]['description'] + "\n"
	return renderedRoom
