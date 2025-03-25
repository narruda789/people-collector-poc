extends GutTest

func test_continue_returns_next_text():
    GameData.next_text = ["Something to say next!"]
    var instruction = ContinueInstruction.new()
    assert_eq(instruction.execute(), "Something to say next!")

func test_subsequent_continue_returns_subsequent_next_text():
    GameData.next_text = ["aisle", "bdellium", "czar"]
    
    var instruction = ContinueInstruction.new()
    assert_eq(instruction.execute(), "aisle")

    instruction = ContinueInstruction.new()
    assert_eq(instruction.execute(), "bdellium")

    instruction = ContinueInstruction.new()
    assert_eq(instruction.execute(), "czar")

func test_continue_returns_nothing_if_no_next_text():
    GameData.next_text = []
    var instruction = ContinueInstruction.new()
    assert_eq(instruction.execute(), "Nothing more to say.")