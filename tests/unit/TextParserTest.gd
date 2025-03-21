extends GutTest

var text_parser = null

func before_each():
	text_parser = TextParser.new()

func test_random_text_produces_error():
	var entered_text = {
		"": InstructionSet.NOT_FOUND,
		" ": InstructionSet.NOT_FOUND,
		" get": InstructionSet.NOT_FOUND,
		"wibble": InstructionSet.NOT_FOUND,
		"notrhitng": InstructionSet.NOT_FOUND,
		"wewst": InstructionSet.NOT_FOUND,
		"southgsd": InstructionSet.NOT_FOUND,
		"estesin": InstructionSet.NOT_FOUND,
		"<script>": InstructionSet.NOT_FOUND,
	}
	for text in entered_text:
		assert_eq(text_parser.parse(text), entered_text[text])

func test_help_is_parsed_correctly():
	assert_eq(text_parser.parse('help'), InstructionSet.HELP)

func test_reset_is_parsed_correctly():
	assert_eq(text_parser.parse('reset'), InstructionSet.RESET)

func test_inventory_is_parsed_correctly():
	var input = [
		"inventory",
		"i",
	]
	for input_option in input:
		assert_eq(text_parser.parse(input_option), InstructionSet.INVENTORY)

func test_object_commands_are_parsed_correctly():
	assert_eq(text_parser.parse("get"), InstructionSet.NOT_FOUND)
	assert_eq(text_parser.parse("getbucket"), InstructionSet.NOT_FOUND)
	assert_eq(text_parser.parse("get-bucket"), InstructionSet.NOT_FOUND)

	var tests = {
		"get bucket": {
			'instruction': InstructionSet.GET,
			'object': 'bucket',
		},
	}
	for test in tests:
		var instruction = text_parser.parse(test)
		assert_eq(instruction, tests[test]['instruction'])
		var object = text_parser.get_target()
		assert_eq(object , tests[test]['object'])

func test_examine_is_parsed_correctly():
	assert_eq(text_parser.parse("examine"), InstructionSet.NOT_FOUND)
	
	var input = [
		{
			"command": "examine geranium",
			"expected_target": "geranium"
		},
		{
			"command": "examine Father",
			"expected_target": "Father"
		},
		{
			"command": "examine jump rope",
			"expected_target": "jump rope"
		}
	]
	for input_option in input:
		assert_eq(text_parser.parse(input_option.command), InstructionSet.EXAMINE)
		assert_eq(text_parser.get_target(), input_option.expected_target)