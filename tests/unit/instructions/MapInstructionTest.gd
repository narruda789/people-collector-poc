extends GutTest

var _mock_areas = {
    "maps" : {
        "ann arbor" : {
            "name" : "Ann Arbor",
            "areas" : [
                "library",
                "stadium",
                "frita batidos"
            ]
        },
        "lansing" : {
            "name" : "Lansing",
            "areas" : [
                "frandor"
            ]
        }
    },
    "library" : {
        "name" : "Library",
        "map" : "ann arbor"
    },
    "stadium" : {
        "name" : "Stadium",
        "map" : "ann arbor"
    },
    "frita batidos" : {
        "name" : "Frita Batidos",
        "map" : "ann arbor"
    },
    "frandor" : {
        "name" : "Frandor",
        "map" : "lansing"
    },
    "mystery spot" : {
        "name" : "Mystery Spot"
    }
}

func before_each():
    GameData.set_game_data(_mock_areas)

func test_map_shows_map_name():
    var instruction = MapInstruction.new(_mock_areas["frita batidos"])
    var map = instruction.execute()
    assert_string_contains(map, "ANN ARBOR")

func test_map_of_ann_arbor():
    var instruction = MapInstruction.new(_mock_areas["library"])
    var map = instruction.execute()
    assert_string_contains(map, "Library")
    assert_string_contains(map, "Stadium")
    assert_string_contains(map, "Frita Batidos")

func test_map_of_lansing():
    var instruction = MapInstruction.new(_mock_areas["frandor"])
    var map = instruction.execute()
    assert_string_contains(map, "Frandor")

func test_map_shows_current_location():
    var instruction = MapInstruction.new(_mock_areas["stadium"])
    var map = instruction.execute()
    assert_string_contains(map, "  Library")
    assert_string_contains(map, "  Stadium (Alya is here!")
    assert_string_contains(map, "  Frita Batidos")

func test_no_map_available():
    var instruction = MapInstruction.new(_mock_areas["mystery spot"])
    var map = instruction.execute()
    assert_string_contains(map, "???:")
    assert_string_contains(map, " (!) No map available!")