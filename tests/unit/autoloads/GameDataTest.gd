extends GutTest

func before_all():
    GameData.initialize()

func test_initialize_area_data():
    assert_eq(GameData.areas["my room"].map, "home")
    assert_eq(GameData.current_area, "my room")
    assert_eq(GameData.current_map, "home")
    assert_eq(GameData.current_poi, null)

func test_initialize_internal_data():
    assert_eq(GameData.next_text, [])
    assert_eq(GameData.auto_commands, [])

func test_initialize_party_stats():
    assert_eq(GameData.stats["party"].defense, 1)
    assert_eq(GameData.stats["party"].resources, 1)
    assert_eq(GameData.stats["party"].charm, 1)
    assert_eq(GameData.stats["party"].morale, 3)

func test_update_party_stat_can_add():
    GameData.update_party_stat(StatBlock.DEFENSE, 1)
    assert_eq(GameData.stats["party"][StatBlock.DEFENSE], 2)

func test_update_party_stat_can_subtract():
    GameData.update_party_stat(StatBlock.RESOURCES, -1)
    assert_eq(GameData.stats["party"][StatBlock.RESOURCES], 0)

func test_cannot_update_below_0():
    GameData.update_party_stat(StatBlock.CHARM, -1000)
    assert_eq(GameData.stats["party"][StatBlock.CHARM], 0)

func test_cannot_update_above_5():
    GameData.update_party_stat(StatBlock.MORALE, 1000)
    assert_eq(GameData.stats["party"][StatBlock.MORALE], 5)