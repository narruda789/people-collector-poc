extends GutTest

func before_each():
    TestUtilities.clear_game_data()
    GameData.stats = {
        "party" : {
            "defense" : 0,
            "resources" : 0,
            "charm" : 0,
            "morale" : 0
        }
    }

func test_shows_stats_headers():
    var instruction = StatsInstruction.new()
    var render = instruction.execute()
    assert_string_contains(render, "PARTY STATS:")
    assert_string_contains(render, "MORALE:")

func test_shows_party_stats():
    var party_stat_blocks = [
        {
            "defense" : 0,
            "resources" : 0,
            "charm" : 0,
            "morale" : 0
        },
        {
            "defense" : 3,
            "resources" : 1,
            "charm" : 3,
            "morale" : 1
        },
        {
            "defense" : 5,
            "resources" : 5,
            "charm" : 5,
            "morale" : 5
        }
    ]

    for stat_block in party_stat_blocks:
        GameData.stats["party"] = stat_block

        var instruction = StatsInstruction.new()
        var render = instruction.execute()

        for key in stat_block.keys():
            var stat_name = key.to_upper()
            var stat_value = stat_block[key]

            # e.g. "[x|x| | | ] MORALE"
            assert_string_contains(render, "  %s %s" % [_stat_bar_for_value(stat_value), stat_name])

func _stat_bar_for_value(value):
    match value:
        0:
            return "[lb] | | | | [rb]"
        1:
            return "[lb]x| | | | [rb]"
        2:
            return "[lb]x|x| | | [rb]"
        3:
            return "[lb]x|x|x| | [rb]"
        4:
            return "[lb]x|x|x|x| [rb]"
        5:
            return "[lb]x|x|x|x|x[rb]"
    assert(false, "Invalid party stat value")