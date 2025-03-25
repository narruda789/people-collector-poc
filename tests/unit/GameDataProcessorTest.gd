extends GutTest

var _processor = GameDataProcessor.new()

func before_each():
	_processor.current_area = GameData.game_data()["alya's room"]

func test_restart_instruction_resets_game_data():
	_processor.current_area = "some area"
	GameData.set_game_data("some game data")
	GameData.set_current_area("some area")
	GameData.set_current_poi("some poi")
	Inventory.add(Item.new("some item", "Some Item"))

	_processor.process_action(InstructionSet.RESTART)
	
	assert_eq(_processor.current_area, GameData.game_data()["alya's room"])
	assert_not_null(GameData.game_data())
	assert_eq(GameData.get_current_area(), "alya's room")
	assert_null(GameData.get_current_poi())
	assert_eq(Inventory.get_as_list(), [])

func test_instruction_calls_execute():
	var instruction_double = InstructionDouble.new()
	_processor.process_action(null, null, instruction_double)
	assert_true(instruction_double.was_execute_called)

func test_restart_instruction_does_not_call_execute():
	var instruction_double = InstructionDouble.new()
	_processor.process_action(InstructionSet.RESTART, null, instruction_double)
	assert_false(instruction_double.was_execute_called)