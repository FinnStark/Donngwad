extends Control

@onready var btn_new: Button = $VBox/BtnNew
@onready var btn_quit: Button = $VBox/BtnQuit

func _ready() -> void:
	btn_new.pressed.connect(_start_game)
	btn_quit.pressed.connect(func(): get_tree().quit())

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		_start_game()

func _start_game() -> void:
	if ResourceLoader.exists("res://local3d/Colony.tscn"):
		get_tree().change_scene_to_file("res://local3d/Colony.tscn")
	else:
		push_error("Colony.tscn manquant (res://local3d/Colony.tscn)")
