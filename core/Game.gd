extends Node

var speed := 1.0 # 0,1,2,3 (0 = pause)
var rng := RandomNumberGenerator.new()

var stocks := {} # clé: "water","food","wood","stone"
var policies := {"military":0.2,"economy":0.5,"social":0.2,"environment":0.1}

const TICK_LOCAL := 0.1   # 100 ms
const TICK_WORLD := 1.0   # 1 s

var _acc_local := 0.0
var _acc_world := 0.0

func _ready():
	rng.randomize()
	stocks = {"water":50.0,"food":50.0,"wood":30.0,"stone":15.0}

func _process(delta):
	if speed <= 0.0: return
	var d: float = delta * speed
	_acc_local += d
	_acc_world += d
	while _acc_local >= TICK_LOCAL:
		_acc_local -= TICK_LOCAL
		TickBus.emit_local_tick(TICK_LOCAL)
	while _acc_world >= TICK_WORLD:
		_acc_world -= TICK_WORLD
		TickBus.emit_world_tick(TICK_WORLD)
