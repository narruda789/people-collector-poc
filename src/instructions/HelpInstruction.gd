class_name HelpInstruction extends Instruction

func execute():
    var helpText = "HELP:"
    helpText += "\n  examine <target>     | Get more information about a target"
    helpText += "\n  take <item>          | Pick up an item"
    helpText += "\n  [lb]i[rb]nventory          | See all the items Alya is carrying"
    helpText += "\n  [lb]m[rb]ap                | View a map of the area"
    helpText += "\n  [lb]g[rb]o (to) <location> | Go to a location on the map"
    helpText += "\n                       |"
    helpText += "\n  restart              | Restart game from the beginning"
    helpText += "\n  help                 | Open this help menu"

    return helpText