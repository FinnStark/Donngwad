extends Control
@onready var lbl := $Stocks
@onready var btn1 := $Speed1
@onready var btn2 := $Speed2
@onready var btn3 := $Speed3
@onready var btnP := $Pause

func _ready():
    btnP.pressed.connect(func(): Game.speed = 0.0)
    btn1.pressed.connect(func(): Game.speed = 1.0)
    btn2.pressed.connect(func(): Game.speed = 2.0)
    btn3.pressed.connect(func(): Game.speed = 3.0)
    TickBus.local_tick.connect(func(_dt): _refresh())

func _refresh():
    var s = Game.stocks
    lbl.text = "Eau: %.1f  Nourriture: %.1f  Bois: %.1f  Pierre: %.1f" % [s["water"], s["food"], s["wood"], s["stone"]]
