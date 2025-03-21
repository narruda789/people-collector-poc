extends GutTest

var _mock_area = {
    "items" : {
        "spoon" : {
            "displayName" : "Spoon"
        },
        "potato chips" : {
            "displayName" : "Potato Chips"
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

func before_each():
    Inventory.clear()

func test_message_take_spoon():
    var instruction = TakeInstruction.new(_mock_area, "spoon")
    assert_eq(instruction.execute(), "Alya picks up the spoon.")

func test_message_take_potato_chips():
    var instruction = TakeInstruction.new(_mock_area, "potato chips")
    assert_eq(instruction.execute(), "Alya picks up the potato chips.")

func test_take_one_item_adds_to_inventory():
    var instruction = TakeInstruction.new(_mock_area, "water bottle")
    instruction.execute()
    var inventory_items = Inventory.get_as_list()
    assert_eq(inventory_items.size(), 1)
    assert_eq(inventory_items[0].get_name(), "water bottle")

func test_take_several_items_adds_to_inventory():
    var instruction = TakeInstruction.new(_mock_area, "bag of marbles")
    instruction.execute()
    instruction = TakeInstruction.new(_mock_area, "pogo stick")
    instruction.execute()
    var inventory_items = Inventory.get_as_list()
    assert_eq(inventory_items.size(), 2)
    assert_eq(inventory_items[0].get_name(), "bag of marbles")
    assert_eq(inventory_items[1].get_name(), "pogo stick")

func test_take_non_existent_item():
    var instruction = TakeInstruction.new(_mock_area, "orca whale")
    assert_eq(instruction.execute(), "Can't pick that up.")

# todo: make commands case insensitive