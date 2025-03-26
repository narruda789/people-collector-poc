extends GutTest

func test_display():
    var stat_blocks = [
        {
            "stats" : StatBlock.new(0, 0, 0, 0),
            "display" : ""
        },
        {
            "stats" : StatBlock.new(1, 0, 2, 0),
            "display" : " (+1 DEFENSE, +2 CHARM)"
        },
        {
            "stats" : StatBlock.new(0, 42, 0, 0),
            "display" : " (+42 RESOURCES)"
        },
        {
            "stats" : StatBlock.new(4, 2, 1, 1),
            "display" : " (+4 DEFENSE, +2 RESOURCES, +1 CHARM, +1 MORALE)"
        },
        {
            "stats" : StatBlock.new(-4, -2, -1, -1),
            "display" : " (-4 DEFENSE, -2 RESOURCES, -1 CHARM, -1 MORALE)"
        }
    ]

    for stat_block in stat_blocks:
        var item = Item.new("item", "Item", stat_block["stats"])
        assert_eq(item.display(), "Item" + stat_block["display"])