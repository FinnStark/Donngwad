extends Node

signal local_tick(dt: float)
signal world_tick(dt: float)

func emit_local_tick(dt: float) -> void:
	emit_signal("local_tick", dt)

func emit_world_tick(dt: float) -> void:
	emit_signal("world_tick", dt)
