extends GutTest

var _processor = GameDataProcessor.new()

func before_each():
	_processor.current_area = _processor.areas["alya's room"]

func test_examine_instruction_sets_current_poi():
	# todo: contact GUT guy with funny test double error...
	# var instruction_double = double(ExamineInstruction)
	var instruction_double = InstructionDouble.new()
	_processor.process_action(InstructionSet.EXAMINE, "oak tree", instruction_double)
	assert_true(instruction_double.was_execute_called)
	assert_eq(_processor.current_poi, "oak tree")

func test_restart_instruction_resets_game_data():
	_processor.current_area = "some area"
	_processor.current_poi = "some poi"
	_processor.areas = "some game data"
	Inventory.add(Item.new("some item"))

	_processor.process_action(InstructionSet.RESTART)
	
	assert_eq(_processor.current_area, _processor.areas["alya's room"])
	assert_null(_processor.current_poi)
	assert_not_null(_processor.areas)
	assert_eq(Inventory.get_as_list(), [])

func test_map_instruction_calls_execute():
	var instruction_double = InstructionDouble.new()
	_processor.process_action(InstructionSet.MAP, null, instruction_double)
	assert_true(instruction_double.was_execute_called)

func test_not_found_instruction_calls_execute():
	var instruction_double = InstructionDouble.new()
	_processor.process_action(InstructionSet.NOT_FOUND, null, instruction_double)
	assert_true(instruction_double.was_execute_called)

func test_help_instruction_calls_execute():
	var instruction_double = InstructionDouble.new()
	_processor.process_action(InstructionSet.HELP, null, instruction_double)
	assert_true(instruction_double.was_execute_called)
