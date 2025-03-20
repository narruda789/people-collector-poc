class_name TextParser

var InstructionSet = load("res://src/InstructionSet.gd")

var object = null

# Parse a given input string into an instruction.
func parse(text):
	match text:
		'go north':
			return InstructionSet.NORTH
		'north':
			return InstructionSet.NORTH
		'go south':
			return InstructionSet.SOUTH
		'south':
			return InstructionSet.SOUTH
		'go east':
			return InstructionSet.EAST
		'east':
			return InstructionSet.EAST
		'go west':
			return InstructionSet.WEST
		'west':
			return InstructionSet.WEST

		'inventory':
			return InstructionSet.INVENTORY
		'i':
			return InstructionSet.INVENTORY

		'look':
			return InstructionSet.LOOK
		'help':
			return InstructionSet.HELP

		'reset':
			return InstructionSet.RESET

	if text.begins_with('get '):
		var regex = RegEx.new()
		regex.compile("get\\s(?<object>.*(\\s.*)?)")
		var results = regex.search(text)
		object = results.get_string('object')
		return InstructionSet.GET

	return InstructionSet.NOT_FOUND

func get_object():
	return object
