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
        "map" : "ann arbor",
        "intro": "It's a restaurant!"
    },
    "frandor" : {
        "name" : "Frandor",
        "map" : "lansing"
    }
}

func before_each():
    GameData.areas = _mock_areas
    GameData.current_map = "ann arbor"
    GameData.current_area = "library"

func test_go_shows_new_area_intro():
    var instruction = GoInstruction.new("frita batidos")
    assert_eq(instruction.execute(), "It's a restaurant!")

func test_go_sets_current_area():
    var instruction = GoInstruction.new("frita batidos")
    instruction.execute()
    assert_eq(GameData.current_area, "frita batidos")

func test_cannot_go_off_map():
    var instruction = GoInstruction.new("frandor")
    assert_eq(instruction.execute(), "Can't go there.")
    assert_eq(GameData.current_area, "library")

func test_cannot_go_to_current_area():
    var instruction = GoInstruction.new("library")
    assert_eq(instruction.execute(), "Already there.")

func test_go_clears_current_poi():
    GameData.current_poi = "some poi"
    var instruction = GoInstruction.new("frita batidos")
    instruction.execute()
    assert_null(GameData.current_poi)

func test_cannot_go_does_not_clear_current_poi():
    GameData.current_poi = "some poi"
    var instruction = GoInstruction.new("frandor")
    instruction.execute()
    assert_eq(GameData.current_poi, "some poi")