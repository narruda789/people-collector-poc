extends GutTest

func before_each():
    Inventory.clear()

func test_has_nothing():
    assert_eq(Inventory.render(), "INVENTORY:\nYou aren't carrying anything.\n")

func test_clear_inventory():
    var item = Item.new("Beach Ball")
    Inventory.add(item)
    assert_eq(Inventory.render(), "INVENTORY:\nBeach Ball\n")

    Inventory.clear()
    assert_eq(Inventory.render(), "INVENTORY:\nYou aren't carrying anything.\n")

func test_has_one_item():
    Inventory.add(Item.new("apple"))
    assert_eq(Inventory.render(), "INVENTORY:\napple\n")

func test_has_two_items():
    Inventory.add(Item.new("catamaran"))
    Inventory.add(Item.new("Dick's Picks"))
    assert_eq(Inventory.render(), "INVENTORY:\ncatamaran\nDick's Picks\n")
