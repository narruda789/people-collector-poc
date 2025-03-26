extends GutTest

func before_each():
    Inventory.clear()
    TestUtilities.clear_game_data()

    GameData.stats = {
        "party" : StatBlock.new(0, 0, 0, 0).get_stats()
    }

    GameData.current_area = "play room"
    GameData.current_poi = "floor"
    GameData.areas = {
        "play room" : {
            "poi" : {
                "locker" : {
                    "items" : {
                        "gym socks" : {
                            "displayName" : "Gym Socks",
                            "modifiers" : {
                                "charm" : -2,
                                "defense" : 1
                            }
                        }
                    }
                },
                "floor" : {
                    "items" : {
                        "spoon" : {
                            "displayName" : "Spoon"
                        },
                        "water bottle" : {
                            "displayName" : "Water Bottle",
                            "modifiers" : {
                                "resources" : 3
                            }
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

func test_take_water_bottle_adds_to_resources_stat():
    var instruction = TakeInstruction.new("water bottle")
    instruction.execute()
    assert_eq(GameData.stats["party"][StatBlock.RESOURCES], 3)

func test_take_water_bottle_adds_to_inventory():
    var instruction = TakeInstruction.new("water bottle")
    instruction.execute()
    _assert_inventory(1, ["Water Bottle (+3 RESOURCES)"])

func test_take_several_items_adds_to_inventory():
    var instruction = TakeInstruction.new("bag of marbles")
    instruction.execute()
    instruction = TakeInstruction.new("pogo stick")
    instruction.execute()
    _assert_inventory(2, ["Bag of Marbles", "Pogo Stick"])

func test_take_gym_socks_affects_party_stats_cannot_be_negative():
    GameData.current_poi = "locker"
    var instruction = TakeInstruction.new("gym socks")
    instruction.execute()
    assert_eq(GameData.stats["party"][StatBlock.DEFENSE], 1)
    assert_eq(GameData.stats["party"][StatBlock.CHARM], 0)

func test_take_gym_socks_removes_it_from_poi():
    GameData.current_poi = "locker"
    var instruction = TakeInstruction.new("gym socks")
    instruction.execute()
    _assert_inventory(1, ["Gym Socks (+1 DEFENSE, -2 CHARM)"])
    assert_does_not_have(GameData.areas["play room"].poi["locker"], "gym socks")

func _assert_inventory(expected_size: int = 0, expected_item_names: Array = []):
    var inventory_items = Inventory.get_as_list()
    assert_eq(inventory_items.size(), expected_size)
    for item in inventory_items:
        assert_true(item.display() in expected_item_names)