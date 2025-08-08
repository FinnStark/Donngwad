extends Node

var speed: float = 1.0 # 0,1,2,3 (0 = pause)
var rng: RandomNumberGenerator = RandomNumberGenerator.new()

var stocks: Dictionary = {} # "water","food","wood","stone"
var policies: Dictionary = {"military":0.2,"economy":0.5,"social":0.2,"environment":0.1}

const TICK_LOCAL := 0.1   # 100 ms
const TICK_WORLD := 1.0   # 1 s

var _acc_local: float = 0.0
var _acc_world: float = 0.0

func _ready() -> void:
	rng.randomize()
	stocks = {"water":50.0,"food":50.0,"wood":30.0,"stone":15.0}

func _process(delta: float) -> void:
	if speed <= 0.0:
		return
	var d: float = delta * speed
	_acc_local += d
	_acc_world += d
	var bus: Node = get_node("/root/TickBus")
	while _acc_local >= TICK_LOCAL:
		_acc_local -= TICK_LOCAL
		bus.emit_local_tick(TICK_LOCAL)
	while _acc_world >= TICK_WORLD:
		_acc_world -= TICK_WORLD
		bus.emit_world_tick(TICK_WORLD)
