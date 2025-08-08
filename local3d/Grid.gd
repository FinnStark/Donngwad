extends GridMap

func _ready():
    var size := 32
    for x in range(size):
        for z in range(size):
            var cell := 0
            if z < 5:
                cell = 2
            elif (x+z) % 11 == 0:
                cell = 1
            set_cell_item(Vector3i(x,0,z), cell, 0)
