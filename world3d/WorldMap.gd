extends Node3D
@onready var nodes_root := $Nodes
@onready var paths_root := $Paths

var nodes := {}
var edges := []

func _ready():
    _load_graph()
    _spawn_markers()
    _spawn_paths()

func _load_graph():
    var f = FileAccess.open("res://data/world_graph.json", FileAccess.READ)
    var d = JSON.parse_string(f.get_as_text()); f.close()
    for n in d["nodes"]:
        nodes[n["id"]] = {"pos": Vector3(n["x"], 0.0, n["z"]), "stock": n.get("stock", {})}
    edges = d["edges"]

func _spawn_markers():
    for id in nodes.keys():
        var mi = MeshInstance3D.new()
        mi.mesh = SphereMesh.new()
        mi.transform.origin = nodes[id]["pos"] + Vector3(0,0.5,0)
        nodes_root.add_child(mi)

func _spawn_paths():
    for e in edges:
        var path = Path3D.new()
        var curve = Curve3D.new()
        var a = nodes[e["a"]]["pos"]
        var b = nodes[e["b"]]["pos"]
        curve.add_point(a + Vector3(0,0.1,0))
        curve.add_point(b + Vector3(0,0.1,0))
        path.curve = curve
        paths_root.add_child(path)
