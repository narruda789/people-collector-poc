extends GutTest

var _input_handler = null

func before_each():
    _input_handler = InputHandler.new()

func after_each():
    TestUtilities.clear_game_data()
    Inventory.clear()

func test_process_restart_continue_renders_intro():
    var restart_render = _input_handler.process_action(InstructionSet.RESTART)
    assert_string_contains(restart_render, "Welcome to ALYA!")
    
    var continue_render = _input_handler.process_action(InstructionSet.CONTINUE)
    assert_string_contains(continue_render, "Today's the day you set off")

func test_process_help_instruction():
    var render = _input_handler.process_action(InstructionSet.HELP)
    assert_string_contains(render, "HELP")

func test_process_not_found_instruction():
    var render = _input_handler.process_action(InstructionSet.NOT_FOUND)
    assert_eq(render, "Can't do that!")

func test_process_stats_instruction():
    _restart_and_continue()
    
    var render = _input_handler.process_action(InstructionSet.STATS)
    assert_string_contains(render, "PARTY STATS")

func test_examine_desk_take_stitch_o_matic_view_inventory_restart():
    _restart_and_continue()

    var examine_render = _input_handler.process_action(InstructionSet.EXAMINE, "desk")
    assert_string_contains(examine_render, "A stack of letters, all from Henry")

    var take_render = _input_handler.process_action(InstructionSet.TAKE, "stitch-o-matic")
    assert_eq(take_render, "Got Stitch-o-Matic.")

    var inventory_render = _input_handler.process_action(InstructionSet.INVENTORY)
    assert_string_contains(inventory_render, "Stitch-o-Matic (+1 RESOURCES)")

    var take_render_already_took = _input_handler.process_action(InstructionSet.TAKE, "stitch-o-matic")
    assert_eq(take_render_already_took, "Can't take that.")

    _restart_and_continue()

    var take_render_no_poi = _input_handler.process_action(InstructionSet.TAKE, "letter")
    assert_eq(take_render_no_poi, "Can't take that.")

    var empty_inventory_render = _input_handler.process_action(InstructionSet.INVENTORY)
    assert_string_contains(empty_inventory_render, "(!) You aren't carrying anything.")

func test_go_downstairs_view_map_talk_elodie_restart():
    _restart_and_continue()

    var go_render = _input_handler.process_action(InstructionSet.GO, "downstairs")
    assert_string_contains(go_render, "You go downstairs.")

    var map_render_downstairs = _input_handler.process_action(InstructionSet.MAP)
    assert_string_contains(map_render_downstairs, "My Room")
    assert_string_contains(map_render_downstairs, "Downstairs (You are here!)")

    var talk_render = _input_handler.process_action(InstructionSet.TALK, "elodie")
    assert_string_contains(talk_render, "Élodie says: \"Hi!\"")

    _restart_and_continue()
    
    var map_render_in_room = _input_handler.process_action(InstructionSet.MAP)
    assert_string_contains(map_render_in_room, "My Room (You are here!)")

# todo: custom instruction for auto-get
#       get from person?
#       get key item?
func test_go_downstairs_talk_elodie_auto_get_dagger_check_inventory():
    _restart_and_continue()
    _input_handler.process_action(InstructionSet.GO, "downstairs")

    var talk_auto_take_render = _input_handler.process_command_text("talk to elodie")

    assert_string_contains(talk_auto_take_render, "Élodie says:")
    # assert_string_contains(talk_auto_take_render, "Got Dagger.")
    # assert_eq(GameData.auto_instruction, "")

    # var inventory_render = _input_handler.process_command_text("i")
    # assert_string_contains(inventory_render, "Dagger (+1 DEFENSE)")
    # assert_false("Got Dagger." in inventory_render)

func _restart_and_continue():
    _input_handler.process_action(InstructionSet.RESTART)
    _input_handler.process_action(InstructionSet.CONTINUE)