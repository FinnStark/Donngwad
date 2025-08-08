extends CanvasLayer

@onready var btn_new := $VBoxContainer/BtnNew
@onready var btn_quit := $VBoxContainer/BtnQuit

func _ready():
    btn_new.pressed.connect(_on_new_game)
    btn_quit.pressed.connect(func(): get_tree().quit())

func _on_new_game():
    get_tree().change_scene_to_file("res://local3d/Colony.tscn")
