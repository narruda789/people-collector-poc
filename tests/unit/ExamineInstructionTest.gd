extends GutTest

var mock_area = {
	"poi" : {
		"cupboard" : {
			"description" : "It's a dusty old cupboard."
		},
        "icebox": {
            "description" : "The icebox is full of frozen meat!"
        },
		"hot dog": {
			"description" : "How long has this been in here...?"
		}
	}
}

func test_examine_cupboard():
	var instruction = ExamineInstruction.new(mock_area, "cupboard")
	assert_eq(instruction.execute(), "It's a dusty old cupboard.")

func test_examine_icebox():
	var instruction = ExamineInstruction.new(mock_area, "icebox")
	assert_eq(instruction.execute(), "The icebox is full of frozen meat!")

func test_examine_hot_dog():
	var instruction = ExamineInstruction.new(mock_area, "hot dog")
	assert_eq(instruction.execute(), "How long has this been in here...?")

func test_examine_non_existent_item():
	var instruction = ExamineInstruction.new(mock_area, "modern potato chips")
	assert_eq(instruction.execute(), "Can't examine that.")