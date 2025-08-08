extends Node
class_name MarketSystem

@export var k := 0.02

func _ready():
    TickBus.world_tick.connect(_on_world_tick)

func _on_world_tick(dt):
    pass

static func price(base:float, stock:float, demand:float, k:float=0.02) -> float:
    return max(0.1, base * (1.0 + k * (demand - stock)))
