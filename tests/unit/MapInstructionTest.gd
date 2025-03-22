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
        }
    },
    "library" : {
        "name" : "Library"
    },
    "stadium" : {
        "name" : "Stadium"
    },
    "frita batidos" : {
        "name" : "Frita Batidos"
    }
}

func test_map_shows_all_areas():
    var instruction = MapInstruction.new(_mock_areas.maps, "library")
    var map = instruction.execute()
    assert_string_contains(map, "Library")
    assert_string_contains(map, "Stadium")
    assert_string_contains(map, "Frita Batidos")