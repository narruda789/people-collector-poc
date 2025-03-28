class_name HelpInstruction extends Instruction

func _execute() -> String:
    var helpText = "HELP:"
    helpText += "\n  examine <target>     | Get more information about a target"
    helpText += "\n  take <item>          | Pick up an item"
    helpText += "\n  [lb]g[rb]o (to) <location> | Go to a location on the map"
    helpText += "\n  [lb]i[rb]nventory          | See all the items you are carrying"
    helpText += "\n  [lb]m[rb]ap                | View a map of the area"
    helpText += "\n  [lb]s[rb]tats              | View your party stats"
    helpText += "\n                       |"
    helpText += "\n  [lb]c[rb]ontinue           | Advance text when you see '...'"
    helpText += "\n  restart              | Restart game from the beginning"
    helpText += "\n  help                 | Open this help menu"
    helpText += "\n"
    helpText += "\nCOMMAND NOTATION:"
    helpText += "\n  <> = required target"
    helpText += "\n  [] = command shortcut"
    helpText += "\n  () = optional preposition"

    return helpText

func _append_auto_command():
    pass