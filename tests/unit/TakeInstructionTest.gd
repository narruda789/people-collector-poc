extends GutTest

var _mock_area = null

func before_each():
    Inventory.clear()
    _mock_area = {
        "poi" : {
            "locker" : {
                "items" : {
                    "gym socks" : {
                        "displayName" : "Gym Socks"
                    }
                }
            }
        },
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
    var instruction = TakeInstruction.new("spoon", _mock_area)
    assert_eq(instruction.execute(), "Alya picks up the spoon.")

func test_message_take_potato_chips():
    var instruction = TakeInstruction.new("potato chips", _mock_area)
    assert_eq(instruction.execute(), "Alya picks up the potato chips.")

func test_take_one_item_adds_to_inventory():
    var instruction = TakeInstruction.new("water bottle", _mock_area)
    instruction.execute()
    _assert_inventory(1, ["water bottle"])

func test_take_several_items_adds_to_inventory():
    var instruction = TakeInstruction.new("bag of marbles", _mock_area)
    instruction.execute()
    instruction = TakeInstruction.new("pogo stick", _mock_area)
    instruction.execute()
    _assert_inventory(2, ["bag of marbles", "pogo stick"])

func test_take_non_existent_item():
    var instruction = TakeInstruction.new("orca whale", _mock_area)
    assert_eq(instruction.execute(), "Can't pick that up.")

func test_no_items_in_area():
    var instruction = TakeInstruction.new("baseball bat", {"description" : "An empty room with nothing to pick up!"})
    assert_eq(instruction.execute(), "Can't pick that up.")

# todo: make sure it's actually permanently removed!
func test_take_item_removes_it_from_area():
    var instruction = TakeInstruction.new("hourglass", _mock_area)
    instruction.execute()
    _assert_inventory(1, ["hourglass"])
    assert_does_not_have(_mock_area["items"], "hourglass")

func test_take_item_removes_it_from_poi():
    var instruction = TakeInstruction.new("gym socks", _mock_area, "locker")
    instruction.execute()
    _assert_inventory(1, ["gym socks"])
    assert_does_not_have(_mock_area.poi["locker"], "gym socks")

func _assert_inventory(expected_size: int = 0, expected_item_names: Array = []):
    var inventory_items = Inventory.get_as_list()
    assert_eq(inventory_items.size(), expected_size)
    for item in inventory_items:
        assert_true(item.get_name() in expected_item_names)