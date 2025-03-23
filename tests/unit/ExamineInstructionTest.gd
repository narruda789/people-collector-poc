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
		"hot dog": {
			"description" : "How long has this been in here...?"
		},
		"shelf" : {
			"description" : "Something's missing...",
			"items" : {}
		}
	}
}

func test_examine_cupboard():
	var instruction = ExamineInstruction.new("cupboard", _mock_area)
	assert_eq(instruction.execute(), "It's a dusty old cupboard.")

func test_examine_poi_with_takeable_items():
	var instruction = ExamineInstruction.new("icebox", _mock_area)
	assert_eq(instruction.execute(), "The icebox is full of frozen meat!\n\nShould I take some meat?")

func test_examine_hot_dog():
	var instruction = ExamineInstruction.new("hot dog", _mock_area)
	assert_eq(instruction.execute(), "How long has this been in here...?")

func test_examine_non_existent_poi():
	var instruction = ExamineInstruction.new("modern potato chips", _mock_area)
	assert_eq(instruction.execute(), "Can't examine that.")

func test_examine_poi_with_empty_item_list():
	var instruction = ExamineInstruction.new("shelf", _mock_area)
	assert_eq(instruction.execute(), "Something's missing...")