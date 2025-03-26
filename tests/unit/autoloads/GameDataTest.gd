extends GutTest

func before_all():
    GameData.initialize()

func test_initialize_area_data():
    assert_eq(GameData.areas["my room"].map, "home")
    assert_eq(GameData.current_area, "my room")
    assert_eq(GameData.current_map, "home")
    assert_eq(GameData.current_poi, null)
    assert_eq(GameData.next_text, [])

func test_initialize_party_stats():
    assert_eq(GameData.stats["party"].defense, 1)
    assert_eq(GameData.stats["party"].resources, 1)
    assert_eq(GameData.stats["party"].charm, 1)
    assert_eq(GameData.stats["party"].morale, 3)