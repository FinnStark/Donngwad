extends Node
class_name ProductionSystem

const CONSUMPTION := {"water":0.05, "food":0.05}
const PASSIVE_PROD := {"wood":0.02}

func _ready():
    TickBus.local_tick.connect(_on_local_tick)

func _on_local_tick(dt):
    var s = Game.stocks
    for k in CONSUMPTION.keys():
        s[k] = max(0.0, s[k] - CONSUMPTION[k] * dt * 10.0)
    for k in PASSIVE_PROD.keys():
        s[k] += PASSIVE_PROD[k] * dt * 10.0
