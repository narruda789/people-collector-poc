extends GutTest

var _text_parser = null

func before_each():
    _text_parser = TextParser.new()

func test_random_text_produces_error():
    var entered_text = {
        "": InstructionSet.NOT_FOUND,
        " ": InstructionSet.NOT_FOUND,
        " take": InstructionSet.NOT_FOUND,
        "wibble": InstructionSet.NOT_FOUND,
        "notrhitng": InstructionSet.NOT_FOUND,
        "wewst": InstructionSet.NOT_FOUND,
        "southgsd": InstructionSet.NOT_FOUND,
        "estesin": InstructionSet.NOT_FOUND,
        "<script>": InstructionSet.NOT_FOUND,
    }
    for text in entered_text:
        assert_eq(_text_parser.parse(text), entered_text[text])

func test_help_is_parsed_correctly():
    assert_eq(_text_parser.parse('help'), InstructionSet.HELP)
    assert_eq(_text_parser.parse('hElP'), InstructionSet.HELP)

func test_restart_is_parsed_correctly():
    assert_eq(_text_parser.parse('restart'), InstructionSet.RESTART)
    assert_eq(_text_parser.parse('rEsTaRt'), InstructionSet.RESTART)

func test_inventory_is_parsed_correctly():
    var input = [
        "inventory",
        "iNvEnToRy",
        "i",
        "I"
    ]
    for input_option in input:
        assert_eq(_text_parser.parse(input_option), InstructionSet.INVENTORY)

func test_object_commands_are_parsed_correctly():
    assert_eq(_text_parser.parse("take"), InstructionSet.NOT_FOUND)
    assert_eq(_text_parser.parse("takebucket"), InstructionSet.NOT_FOUND)
    assert_eq(_text_parser.parse("take-bucket"), InstructionSet.NOT_FOUND)

    var tests = {
        "take bucket": {
            'instruction': InstructionSet.TAKE,
            'object': 'bucket',
        },
        "tAkE bUcKeT": {
            'instruction': InstructionSet.TAKE,
            'object': 'bucket',
        },
    }
    for test in tests:
        var instruction = _text_parser.parse(test)
        assert_eq(instruction, tests[test]['instruction'])
        var object = _text_parser.get_target()
        assert_eq(object , tests[test]['object'])

func test_examine_is_parsed_correctly():
    assert_eq(_text_parser.parse("examine"), InstructionSet.NOT_FOUND)
    
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
        assert_eq(_text_parser.parse(input_option.command), InstructionSet.EXAMINE)
        assert_eq(_text_parser.get_target(), input_option.expected_target)

func test_map_is_parsed_correctly():
    var input = [
        "map",
        "MAP",
        "m",
        "M"
    ]
    for input_option in input:
        assert_eq(_text_parser.parse(input_option), InstructionSet.MAP)

func test_go_is_parsed_correctly():
    assert_eq(_text_parser.parse("go"), InstructionSet.NOT_FOUND)

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
        assert_eq(_text_parser.parse(input_option.command), InstructionSet.GO)
        assert_eq(_text_parser.get_target(), input_option.expected_target)

func test_continue_is_parsed_correctly():
    var input = [
        "continue",
        "CONTINUE",
        "c",
        "C"
    ]
    for input_option in input:
        assert_eq(_text_parser.parse(input_option), InstructionSet.CONTINUE)

func test_stats_is_parsed_correctly():
    var input = [
        "stats",
        "STATS",
        "s",
        "S"
    ]
    for input_option in input:
        assert_eq(_text_parser.parse(input_option), InstructionSet.STATS)

func test_talk_is_parsed_correctly():
    assert_eq(_text_parser.parse("talk"), InstructionSet.NOT_FOUND)

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
        }
    ]
    for input_option in input:
        assert_eq(_text_parser.parse(input_option.command), InstructionSet.TALK)
        assert_eq(_text_parser.get_target(), input_option.expected_target)