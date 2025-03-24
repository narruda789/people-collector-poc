extends GutTest

func test_help_instruction_says_help():
	var instruction = HelpInstruction.new()
	assert_string_contains(instruction.execute(), "HELP:")

func test_help_instruction_contains_every_instruction():
	var instruction = HelpInstruction.new()
	var message = instruction.execute()
	assert_string_contains(message, "examine")
	assert_string_contains(message, "take")
	assert_string_contains(message, "restart")
	assert_string_contains(message, "help")
	assert_string_contains(message, "[lb]i[rb]nventory")
	assert_string_contains(message, "[lb]m[rb]ap")
