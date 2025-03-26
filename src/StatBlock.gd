class_name StatBlock

const DEFENSE = "defense"

const RESOURCES = "resources"

const CHARM = "charm"

const MORALE = "morale"

var _stats = {
    DEFENSE : 0,
    RESOURCES : 0,
    CHARM : 0,
    MORALE : 0
}

# todo: can/should this be a struct?
func _init(defense = 0, resources = 0, charm = 0, morale = 0):
    _stats[DEFENSE] = defense
    _stats[RESOURCES] = resources
    _stats[CHARM] = charm
    _stats[MORALE] = morale

static func _from_dict(stats: Dictionary) -> StatBlock:
    var stat_block = StatBlock.new()
    stat_block._stats = stats
    return stat_block

func get_stats():
    return _stats

func set_stats(stats):
    _stats = stats