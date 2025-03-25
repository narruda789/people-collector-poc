extends GutTest

func test_shows_default_party_stats():
    GameData.next_text = []
    var instruction = StatsInstruction.new()
    var render = instruction.execute()
    assert_string_contains(render, "PARTY STATS:")
    assert_string_contains(render, "  [lb] | | | | [rb] DEFENSE")
    assert_string_contains(render, "  [lb] | | | | [rb] RESOURCES")
    assert_string_contains(render, "  [lb] | | | | [rb] CHARM")
    assert_string_contains(render, "MORALE:")
    assert_string_contains(render, "  [lb] | | | | [rb] DEFENSE")