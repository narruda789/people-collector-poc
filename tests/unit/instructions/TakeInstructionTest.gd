extends GutTest

func before_each():
    Inventory.clear()
    GameData.current_area = "play room"
    GameData.current_poi = "floor"
    GameData.next_text = []
    GameData.areas = {
        "play room" : {
            "poi" : {
                "locker" : {
                    "items" : {
                        "gym socks" : {
                            "displayName" : "Gym Socks"
                        }
                    }
                },
                "floor" : {
                    "items" : {
                        "spoon" : {
                            "displayName" : "Spoon"
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
            }
        }
    }

func test_take_spoon():
    var instruction = TakeInstruction.new("spoon")
    assert_eq(instruction.execute(), "You pick up the Spoon.")

func test_take_spoon_when_item_not_in_current_poi():
    GameData.current_poi = "locker"
    var instruction = TakeInstruction.new("spoon")
    assert_eq(instruction.execute(), "Can't pick that up.")

func test_take_spoon_when_current_poi_null():
    GameData.current_poi = null
    var instruction = TakeInstruction.new("spoon")
    assert_eq(instruction.execute(), "Can't pick that up.")

func test_take_one_item_adds_to_inventory():
    var instruction = TakeInstruction.new("water bottle")
    instruction.execute()
    _assert_inventory(1, ["Water Bottle"])

func test_take_several_items_adds_to_inventory():
    var instruction = TakeInstruction.new("bag of marbles")
    instruction.execute()
    instruction = TakeInstruction.new("pogo stick")
    instruction.execute()
    _assert_inventory(2, ["Bag of Marbles", "Pogo Stick"])

func test_take_item_removes_it_from_poi():
    GameData.current_poi = "locker"
    var instruction = TakeInstruction.new("gym socks")
    instruction.execute()
    _assert_inventory(1, ["Gym Socks"])
    assert_does_not_have(GameData.areas["play room"].poi["locker"], "gym socks")

func _assert_inventory(expected_size: int = 0, expected_item_names: Array = []):
    var inventory_items = Inventory.get_as_list()
    assert_eq(inventory_items.size(), expected_size)
    for item in inventory_items:
        assert_true(item.get_display_name() in expected_item_names)