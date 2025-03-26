extends GutTest

func test_help_instruction_says_help():
	var instruction = HelpInstruction.new()
	assert_string_contains(instruction.execute(), "HELP:")

func test_help_instruction_contains_every_instruction():
	var instruction = HelpInstruction.new()
	var message = instruction.execute()
	assert_string_contains(message, "examine")
	assert_string_contains(message, "take")
	assert_string_contains(message, "[lb]g[rb]o (to)")
	assert_string_contains(message, "[lb]i[rb]nventory")
	assert_string_contains(message, "[lb]m[rb]ap")
	assert_string_contains(message, "[lb]s[rb]tats")
	assert_string_contains(message, "[lb]c[rb]ontinue")
	assert_string_contains(message, "restart")
	assert_string_contains(message, "help")

func test_help_instruction_explains_notation():
	var instruction = HelpInstruction.new()
	assert_string_contains(instruction.execute(), "<> = required target")
	assert_string_contains(instruction.execute(), "[] = command shortcut")
	assert_string_contains(instruction.execute(), "() = optional preposition")
