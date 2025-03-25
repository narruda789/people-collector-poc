extends GutTest

var _mock_area = {
	"poi" : {
		"cupboard" : {
			"description" : "It's a dusty old cupboard."
		},
        "icebox": {
            "description" : "The icebox is full of frozen meat!",
			"items" : {
				"meat" : {
					"displayName" : "Meat",
					"description" : "A slab of frozen meat.",
					"beforePickup" : "Should I take some meat?"
				}
			}
        },
		"shelf" : {
			"description" : "Something's missing...",
			"items" : {}
		},
		"floorboard" : {
			"description" : "This floorboard is loose! What's underneath...?",
			"items" : {
				"coins" : {
					"displayName" : "Coins",
					"beforePickup" : "There's a pile of coins here!"
				},
				"photo album" : {
					"displayName" : "Photo Album",
					"beforePickup" : "This looks like someone's photo album."
				}
			}
		}
	}
}

func before_each():
	GameData.set_current_poi("prior poi")

func test_examine_cupboard():
	var instruction = ExamineInstruction.new("cupboard", _mock_area)
	assert_eq(instruction.execute(), "It's a dusty old cupboard.")
	assert_eq(GameData.get_current_poi(), "cupboard")

func test_examine_non_existent_poi():
	var instruction = ExamineInstruction.new("modern potato chips", _mock_area)
	assert_eq(instruction.execute(), "Can't examine that.")
	assert_eq(GameData.get_current_poi(), "prior poi")

func test_examine_null_poi():
	var instruction = ExamineInstruction.new(null, _mock_area)
	assert_eq(instruction.execute(), "Can't examine that.")
	assert_eq(GameData.get_current_poi(), "prior poi")

func test_examine_poi_with_empty_item_list():
	var instruction = ExamineInstruction.new("shelf", _mock_area)
	assert_eq(instruction.execute(), "Something's missing...")
	assert_eq(GameData.get_current_poi(), "shelf")

func test_examine_poi_with_one_takeable_item():
	var instruction = ExamineInstruction.new("icebox", _mock_area)
	assert_eq(instruction.execute(), "The icebox is full of frozen meat!\n\nShould I take some meat?")
	assert_eq(GameData.get_current_poi(), "icebox")

func test_examine_poi_with_multiple_takeable_items():
	var instruction = ExamineInstruction.new("floorboard", _mock_area)
	var expected_message = "This floorboard is loose! What's underneath...?"
	expected_message += "\n\nThere's a pile of coins here!"
	expected_message += "\n\nThis looks like someone's photo album."
	assert_eq(instruction.execute(), expected_message)
	assert_eq(GameData.get_current_poi(), "floorboard")
