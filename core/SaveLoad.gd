extends Node
class_name SaveLoad

static func save_state(path:String):
    var data = {
        "stocks": Game.stocks,
        "policies": Game.policies
    }
    var f = FileAccess.open(path, FileAccess.WRITE)
    f.store_string(JSON.stringify(data))
    f.close()

static func load_state(path:String):
    if not FileAccess.file_exists(path): return
    var f = FileAccess.open(path, FileAccess.READ)
    var obj = JSON.parse_string(f.get_as_text())
    f.close()
    if typeof(obj)==TYPE_DICTIONARY:
        Game.stocks = obj.get("stocks", Game.stocks)
        Game.policies = obj.get("policies", Game.policies)
