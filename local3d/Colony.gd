extends Node3D
@onready var cam := $Camera3D

var yaw := 0.0
var dist := 18.0

func _ready():
    Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _unhandled_input(e):
    if e is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
        yaw -= e.relative.x * 0.2
        _update_cam()
    if e is InputEventMouseButton and e.button_index==MOUSE_BUTTON_WHEEL_UP and e.pressed:
        dist = max(6.0, dist-1.5); _update_cam()
    if e is InputEventMouseButton and e.button_index==MOUSE_BUTTON_WHEEL_DOWN and e.pressed:
        dist = min(40.0, dist+1.5); _update_cam()

func _process(delta):
    var pan = Vector3.ZERO
    if Input.is_action_pressed("ui_right"): pan.x += 1
    if Input.is_action_pressed("ui_left"):  pan.x -= 1
    if Input.is_action_pressed("ui_up"):    pan.z -= 1
    if Input.is_action_pressed("ui_down"):  pan.z += 1
    translate(pan.normalized() * delta * 10.0)

func _update_cam():
    var offset = Vector3(dist, dist*0.6, dist).rotated(Vector3.UP, deg_to_rad(yaw))
    cam.transform.origin = global_transform.origin + offset
    cam.look_at(global_transform.origin, Vector3.UP)
