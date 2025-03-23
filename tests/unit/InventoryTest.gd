extends GutTest

func before_each():
	Inventory.clear()

# todo: inventory should probably be stored as a dictionary...

func test_has_nothing():
	assert_eq(Inventory.render(), "INVENTORY:\n (!) You aren't carrying anything.")

func test_clear_inventory():
	var item = Item.new("beach ball", "Beach Ball")
	Inventory.add(item)
	assert_eq(Inventory.render(), "INVENTORY:\n  Beach Ball")

	Inventory.clear()
	assert_eq(Inventory.render(), "INVENTORY:\n (!) You aren't carrying anything.")

func test_has_one_item():
	Inventory.add(Item.new("apple", "Apple"))
	assert_eq(Inventory.render(), "INVENTORY:\n  Apple")

func test_has_two_items():
	Inventory.add(Item.new("catamaran", "Catamaran"))
	Inventory.add(Item.new("dick's pick's", "Dick's Picks"))
	assert_eq(Inventory.render(), "INVENTORY:\n  Catamaran\n  Dick's Picks")
