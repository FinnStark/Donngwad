extends Camera3D

@export var move_speed: float = 12.0
@export var zoom_min: float = 6.0
@export var zoom_max: float = 40.0
var dist: float = 18.0
var yaw: float = 0.0

func _ready() -> void:
	current = true
	_update_transform()

func _unhandled_input(e: InputEvent) -> void:
	if e is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		yaw -= e.relative.x * 0.2
		_update_transform()
	if e is InputEventMouseButton and e.pressed:
		if e.button_index == MOUSE_BUTTON_WHEEL_UP:
			dist = max(zoom_min, dist - 2.0); _update_transform()
		elif e.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			dist = min(zoom_max, dist + 2.0); _update_transform()

func _process(delta: float) -> void:
	var dir := Vector3.ZERO
	if Input.is_action_pressed("ui_right"): dir.x += 1
	if Input.is_action_pressed("ui_left"):  dir.x -= 1
	if Input.is_action_pressed("ui_up"):    dir.z -= 1
	if Input.is_action_pressed("ui_down"):  dir.z += 1
	if dir != Vector3.ZERO:
		var parent := get_parent() as Node3D
		if parent:
			parent.translate(dir.normalized() * move_speed * delta)

func _update_transform() -> void:
	var parent := get_parent() as Node3D
	if not parent: return
	var target: Vector3 = parent.global_transform.origin
	var offset: Vector3 = Vector3(dist, dist * 0.6, dist).rotated(Vector3.UP, deg_to_rad(yaw))
	global_transform.origin = target + offset
	look_at(target, Vector3.UP)
