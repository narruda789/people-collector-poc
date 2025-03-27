extends GutTest

func before_each():
    GameData.areas = {
        "library" : {
            "people" : {
                "librarian" : {
                    "name" : "Librarian",
                    "talk" : "Shhh!",
                    "on_talk" : "instruction to run automatically"
                },
                "quiet student" : {
                    "name" : "Quiet Student"
                }
            }
        }
    }
    GameData.current_area = "library"

func test_talk_to_librarian():
    var instruction = TalkInstruction.new("librarian")
    assert_eq(instruction.execute(), "Librarian says: \"Shhh!\"")

func test_person_does_not_speak():
    var instruction = TalkInstruction.new("quiet student")
    assert_eq(instruction.execute(), "Quiet Student says nothing.")

func test_person_not_in_area():
    var instruction = TalkInstruction.new("seagull")
    assert_eq(instruction.execute(), "Can't talk to them.")

func test_no_people_in_area():
    GameData.areas = {
        "empty room" : {}
    }
    GameData.current_area = "empty room"
    var instruction = TalkInstruction.new("anybody")
    assert_eq(instruction.execute(), "Can't talk to them.")

func test_store_auto_instruction_in_game_data():
    var instruction = TalkInstruction.new("librarian")
    instruction.execute()
    assert_eq(GameData.auto_instruction, "instruction to run automatically")