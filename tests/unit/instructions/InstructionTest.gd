extends GutTest

func test_instructions_that_cannot_execute_before_continue():
	# todo: might be nice to include something that catches anything in InstructionSet
	#       that does not appear here (force me to handle it) bc I 100% WILL FORGET
	var input_options = [
		{
			"instruction" : ExamineInstruction.new("thing"),
			"default_message" : "Can't examine that."
		},
		{
			"instruction" : TakeInstruction.new("thing"),
			"default_message" : "Can't take that."
		},
		{
			"instruction" : TalkInstruction.new("thing"),
			"default_message" : "Can't talk to them."
		},
		{
			"instruction" : InventoryInstruction.new(),
			"default_message" : "INVENTORY:"
		},
		{
			"instruction" : MapInstruction.new(),
			"default_message" : ":"
		},
		{
			"instruction" : GoInstruction.new("thing"),
			"default_message" : "Can't go there."
		},
		{
			"instruction" : StatsInstruction.new(),
			"default_message" : "PARTY STATS:"
		}
	]

	for input in input_options:
		GameData.next_text = ["something here"]
		assert_eq(input.instruction.execute(), "Must continue reading first.")

		GameData.next_text = []
		assert_string_contains(input.instruction.execute(), input.default_message)