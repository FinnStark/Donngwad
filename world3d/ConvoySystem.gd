extends Node
class_name ConvoySystem

var convoys := []

func _ready():
    TickBus.world_tick.connect(_on_world_tick)

func create_convoy(path:Path3D, cargo:Dictionary, speed:=6.0):
    var follower = PathFollow3D.new()
    path.add_child(follower)
    convoys.append({"path":path,"follower":follower,"speed":speed,"cargo":cargo,"eta":0.0})

func _on_world_tick(dt):
    for c in convoys:
        var f:PathFollow3D = c["follower"]
        f.progress += c["speed"] * dt
        if f.progress_ratio >= 1.0:
            f.queue_free()
    convoys = convoys.filter(func(x): return x.has("follower") and x["follower"].is_inside_tree())
