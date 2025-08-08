extends Node
class_name TickBus
signal local_tick(dt)
signal world_tick(dt)

func emit_local_tick(dt): emit_signal("local_tick", dt)
func emit_world_tick(dt): emit_signal("world_tick", dt)
