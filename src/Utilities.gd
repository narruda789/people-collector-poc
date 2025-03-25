class_name Utilities

# todo: test me, test me, why don't you arrest me!
static func load_json_data_as_dictionary(file_path):
    var file = FileAccess.open(file_path, FileAccess.READ)
    var json_string = file.get_as_text()
    file.close()

    var json = JSON.new()
    var error = json.parse(json_string)
    if error == OK:
        var data_received = json.data
        if typeof(data_received) == TYPE_DICTIONARY:
            return data_received
        else:
            assert(false, "Expected Variant.Type 27 (TYPE_DICTIONARY) but got Type %i" % typeof(data_received))
    else:
        print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
        assert(false, "JSON Parse Error")