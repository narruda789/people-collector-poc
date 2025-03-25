extends GutTest

var _processor = GameDataProcessor.new()

func before_each():
	_processor.current_area = GameData.game_data()["alya's room"]

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
	GameData.set_game_data("some game data")
	Inventory.add(Item.new("some item", "Some Item"))

	_processor.process_action(InstructionSet.RESTART)
	
	assert_eq(_processor.current_area, GameData.game_data()["alya's room"])
	assert_null(_processor.current_poi)
	assert_not_null(GameData.game_data())
	assert_eq(Inventory.get_as_list(), [])

func test_instruction_calls_execute():
	var instruction_double = InstructionDouble.new()
	_processor.process_action(null, null, instruction_double)
	assert_true(instruction_double.was_execute_called)

func test_restart_instruction_does_not_call_execute():
	var instruction_double = InstructionDouble.new()
	_processor.process_action(InstructionSet.RESTART, null, instruction_double)
	assert_false(instruction_double.was_execute_called)