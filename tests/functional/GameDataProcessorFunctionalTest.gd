extends GutTest

var _processor = null

func before_each():
    _processor = GameDataProcessor.new()

func after_each():
    TestUtilities.clear_game_data()
    Inventory.clear()

func test_process_restart_instruction_renders_intro():
    var render = _processor.process_action(InstructionSet.RESTART)
    assert_string_contains(render, "It's finally here!")

func test_process_help_instruction():
    var render = _processor.process_action(InstructionSet.HELP)
    assert_string_contains(render, "HELP")

func test_process_not_found_instruction():
    var render = _processor.process_action(InstructionSet.NOT_FOUND)
    assert_eq(render, "Can't do that!")

func test_examine_desk_take_letter_view_inventory_restart():
    _processor.process_action(InstructionSet.RESTART)

    var examine_render = _processor.process_action(InstructionSet.EXAMINE, "desk")
    assert_string_contains(examine_render, "A stack of letters, all from Henry")

    var take_render = _processor.process_action(InstructionSet.TAKE, "letter")
    assert_eq(take_render, "Alya picks up the Letter.")

    var inventory_render = _processor.process_action(InstructionSet.INVENTORY)
    assert_string_contains(inventory_render, "Letter")

    var take_render_already_took = _processor.process_action(InstructionSet.TAKE, "letter")
    assert_eq(take_render_already_took, "Can't pick that up.")

    _processor.process_action(InstructionSet.RESTART)

    var take_render_no_poi = _processor.process_action(InstructionSet.TAKE, "letter")
    assert_eq(take_render_no_poi, "Can't pick that up.")

    var empty_inventory_render = _processor.process_action(InstructionSet.INVENTORY)
    assert_string_contains(empty_inventory_render, "(!) You aren't carrying anything.")

func test_go_downstairs_view_map_restart():
    _processor.process_action(InstructionSet.RESTART)

    var go_render = _processor.process_action(InstructionSet.GO, "downstairs")
    assert_string_contains(go_render, "Alya goes downstairs.")

    var map_render_downstairs = _processor.process_action(InstructionSet.MAP)
    assert_string_contains(map_render_downstairs, "Alya's Room")
    assert_string_contains(map_render_downstairs, "Downstairs (Alya is here!)")

    _processor.process_action(InstructionSet.RESTART)
    
    var map_render_in_room = _processor.process_action(InstructionSet.MAP)
    assert_string_contains(map_render_in_room, "Alya's Room (Alya is here!)")