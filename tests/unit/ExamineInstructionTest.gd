extends GutTest

var mock_area = {
	"poi" : {
		"cupboard" : {
			"description" : "It's a dusty old cupboard."
		},
        "icebox": {
            "description" : "The icebox is full of frozen meat!"
        }
	}
}

func test_examine_cupboard():
	var instruction = ExamineInstruction.new(mock_area, "cupboard")
	assert_eq(instruction.execute(), "It's a dusty old cupboard.")

func test_examine_icebox():
	var instruction = ExamineInstruction.new(mock_area, "icebox")
	assert_eq(instruction.execute(), "The icebox is full of frozen meat!")
