extends MultiMeshInstance3D

@export var count := 300
@export var area := Vector2(32,32)

func _ready():
    multimesh.instance_count = count
    for i in range(count):
        var x = randf() * area.x
        var z = randf() * area.y
        var t := Transform3D.IDENTITY
        t.origin = Vector3(x, 0.0, z)
        t = t.scaled(Vector3(0.9 + randf()*0.4, 0.9 + randf()*0.4, 0.9 + randf()*0.4))
        multimesh.set_instance_transform(i, t)
