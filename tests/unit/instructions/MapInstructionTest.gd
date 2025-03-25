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
    GameData.set_current_area("frita batidos")
    var instruction = MapInstruction.new()
    assert_string_contains(instruction.execute(), "ANN ARBOR")

func test_map_of_ann_arbor():
    GameData.set_current_area("library")
    var instruction = MapInstruction.new()
    var map = instruction.execute()
    assert_string_contains(map, "Library")
    assert_string_contains(map, "Stadium")
    assert_string_contains(map, "Frita Batidos")

func test_map_of_lansing():
    GameData.set_current_area("frandor")
    var instruction = MapInstruction.new()
    assert_string_contains(instruction.execute(), "Frandor")

func test_map_shows_current_location():
    GameData.set_current_area("stadium")
    var instruction = MapInstruction.new()
    var map = instruction.execute()
    assert_string_contains(map, "  Library")
    assert_string_contains(map, "  Stadium (Alya is here!")
    assert_string_contains(map, "  Frita Batidos")

func test_no_map_available():
    GameData.set_current_area("mystery spot")
    var instruction = MapInstruction.new()
    var map = instruction.execute()
    assert_string_contains(map, "???:")
    assert_string_contains(map, " (!) No map available!")

# todo: This feels like the wrong place to handle this case,
#       but at least it's handled.
func test_current_area_not_found():
    GameData.set_current_area("some other area")
    var instruction = MapInstruction.new()
    var map = instruction.execute()
    assert_string_contains(map, "???:")
    assert_string_contains(map, " (!) No map available!")