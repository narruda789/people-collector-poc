extends GutTest

func test_not_found_returns_error_mesage():
    var instruction = NotFoundInstruction.new()
    assert_eq(instruction.execute(), "Can't do that!")