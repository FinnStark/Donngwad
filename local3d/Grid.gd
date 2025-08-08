extends GridMap

@export var size_x := 32
@export var size_z := 32
@export var water_z := 0   # si tu veux une “rivière” en z<water_z

func _ready() -> void:
	# 1) MeshLibrary minimaliste (cube + herbe)
	var ml := MeshLibrary.new()
	var cube := BoxMesh.new()
	var mat := StandardMaterial3D.new()
	mat.albedo_color = Color(0.20, 0.50, 0.20) # vert sobre
	cube.material = mat
	ml.create_item(0)
	ml.set_item_name(0, "grass")
	ml.set_item_mesh(0, cube)
	mesh_library = ml

	# 2) Remplir la grille
	for x in range(size_x):
		for z in range(size_z):
			set_cell_item(Vector3i(x, 0, z), 0)
