extends Control

func _ready() -> void:
    print("Title screen ready")

func _input(event):
    if event.is_action_pressed("ui_accept"):
        print("Start game")
        # Ici, on changera de scène plus tard
