extends GutTest

var _mock_area = null

func before_each():
    Inventory.clear()
    _mock_area = {
        "items" : {
            "spoon" : {
                "displayName" : "Spoon"
            },
            "potato chips" : {
                "displayName" : "Potato Chips"
            },
            "hourglass" : {
                "displayName" : "Hourglass"
            },
            "water bottle" : {
                "displayName" : "Water Bottle"
            },
            "bag of marbles" : {
                "displayName" : "Bag of Marbles"
            },
            "pogo stick" : {
                "displayName" : "Pogo Stick"
            }
        }
    }

func test_message_take_spoon():
    var instruction = TakeInstruction.new(_mock_area, "spoon")
    assert_eq(instruction.execute(), "Alya picks up the spoon.")

func test_message_take_potato_chips():
    var instruction = TakeInstruction.new(_mock_area, "potato chips")
    assert_eq(instruction.execute(), "Alya picks up the potato chips.")

func test_take_one_item_adds_to_inventory():
    var instruction = TakeInstruction.new(_mock_area, "water bottle")
    instruction.execute()
    _assert_inventory(1, ["water bottle"])

func test_take_several_items_adds_to_inventory():
    var instruction = TakeInstruction.new(_mock_area, "bag of marbles")
    instruction.execute()
    instruction = TakeInstruction.new(_mock_area, "pogo stick")
    instruction.execute()
    _assert_inventory(2, ["bag of marbles", "pogo stick"])

func test_take_non_existent_item():
    var instruction = TakeInstruction.new(_mock_area, "orca whale")
    assert_eq(instruction.execute(), "Can't pick that up.")

# todo: make sure it's actually permanently removed!
func test_take_item_removes_it_from_area():
    var instruction = TakeInstruction.new(_mock_area, "hourglass")
    instruction.execute()
    _assert_inventory(1, ["hourglass"])
    assert_does_not_have(_mock_area.items, "hourglass")

func _assert_inventory(expected_size: int = 0, expected_item_names: Array = []):
    var inventory_items = Inventory.get_as_list()
    assert_eq(inventory_items.size(), expected_size)
    for item in inventory_items:
        assert_true(item.get_name() in expected_item_names)