extends GutTest

var _text_parser = null

func before_each():
    _text_parser = TextParser.new()

func test_random_text_produces_error():
    var entered_text = [
        "",
        " ",
        " take",
        "wibble",
        "notrhitng",
        "wewst",
        "southgsd",
        "estesin",
        "<script>",
    ]
    for text in entered_text:
        assert_typeof(_text_parser.parse_user_command(text), typeof(NotFoundInstruction))

func test_help_is_parsed_correctly():
    assert_typeof(_text_parser.parse_user_command('help'), typeof(HelpInstruction))
    assert_typeof(_text_parser.parse_user_command('hElP'), typeof(HelpInstruction))

func test_restart_is_parsed_correctly():
    assert_typeof(_text_parser.parse_user_command('restart'), typeof(RestartInstruction.new()))
    assert_typeof(_text_parser.parse_user_command('rEsTaRt'), typeof(RestartInstruction.new()))

func test_inventory_is_parsed_correctly():
    var input = [
        "inventory",
        "iNvEnToRy",
        "i",
        "I"
    ]
    for input_option in input:
        assert_typeof(_text_parser.parse_user_command(input_option), typeof(InventoryInstruction))

func test_take_is_parsed_correctly():
    assert_typeof(_text_parser.parse_user_command("take"), typeof(NotFoundInstruction))
    assert_typeof(_text_parser.parse_user_command("takebucket"), typeof(NotFoundInstruction))
    assert_typeof(_text_parser.parse_user_command("take-bucket"), typeof(NotFoundInstruction))

    var input = [
        {
            "command": "take bucket",
            "expected_target": "bucket"
        },
        {
            "command": "tAkE bUcKeT",
            "expected_target": "bucket"
        }
    ]
    for input_option in input:
        var instruction = _text_parser.parse_user_command(input_option.command)
        assert_typeof(instruction, typeof(TakeInstruction))
        assert_eq(instruction._item, input_option["expected_target"])

func test_examine_is_parsed_correctly():
    assert_typeof(_text_parser.parse_user_command("examine"), typeof(NotFoundInstruction))
    
    var input = [
        {
            "command": "examine geranium",
            "expected_target": "geranium"
        },
        {
            "command": "eXaMiNe Father",
            "expected_target": "father"
        },
        {
            "command": "EXAMINE JUMP ROPE",
            "expected_target": "jump rope"
        }
    ]
    for input_option in input:
        var instruction = _text_parser.parse_user_command(input_option.command)
        assert_typeof(instruction, typeof(ExamineInstruction))
        assert_eq(instruction._poi, input_option.expected_target)

func test_map_is_parsed_correctly():
    var input = [
        "map",
        "MAP",
        "m",
        "M"
    ]
    for input_option in input:
        assert_typeof(_text_parser.parse_user_command(input_option), typeof(MapInstruction))

func test_go_is_parsed_correctly():
    assert_typeof(_text_parser.parse_user_command("go"), typeof(NotFoundInstruction))

    var input = [
        {
            "command" : "go wild",
            "expected_target" : "wild"
        },
        {
            "command" : "gO oVeR tHeRe",
            "expected_target" : "over there"
        },
        {
            "command" : "go to outer space",
            "expected_target" : "outer space"
        },
        {
            "command" : "go incognito mode",
            "expected_target" : "incognito mode" 
        },
        {
            "command" : "go toward the light",
            "expected_target" : "toward the light"
        }
    ]
    for input_option in input:
        var instruction = _text_parser.parse_user_command(input_option.command)
        assert_typeof(instruction, typeof(GoInstruction))
        assert_eq(instruction._new_area, input_option.expected_target)

func test_continue_is_parsed_correctly():
    var input = [
        "continue",
        "CONTINUE",
        "c",
        "C"
    ]
    for input_option in input:
        assert_typeof(_text_parser.parse_user_command(input_option), typeof(ContinueInstruction))

func test_stats_is_parsed_correctly():
    var input = [
        "stats",
        "STATS",
        "s",
        "S"
    ]
    for input_option in input:
        assert_typeof(_text_parser.parse_user_command(input_option), typeof(StatsInstruction))

func test_talk_is_parsed_correctly():
    GameData.areas = {
        "test" : ""
    }
    GameData.current_area = "test"
    assert_typeof(_text_parser.parse_user_command("talk"), typeof(NotFoundInstruction))

    var input = [
        {
            "command" : "talk goblin",
            "expected_target" : "goblin"
        },
        {
            "command" : "tAlK sEnTiEnT mUsHrOoM",
            "expected_target" : "sentient mushroom"
        },
        {
            "command" : "talk to sexy chupacabra",
            "expected_target" : "sexy chupacabra"
        },
        {
            "command" : "talk tomato",
            "expected_target" : "tomato" 
        },
        {
            "command" : "talk togepi",
            "expected_target" : "togepi"
        },
        {
            "command" : "talk Élodie",
            "expected_target" : "elodie"
        },
        {
            "command" : "talk to élodie",
            "expected_target" : "elodie"
        }
    ]
    for input_option in input:
        var instruction = _text_parser.parse_user_command(input_option.command)
        assert_typeof(instruction, typeof(TalkInstruction))
        assert_eq(instruction._person, input_option.expected_target)
