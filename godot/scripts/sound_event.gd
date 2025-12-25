class_name SoundEvent
extends RefCounted

var position: Vector2
var radius: float
var intensity: float
var decay_time: float
var source: Node = null
var elapsed := 0.0

func _init(pos: Vector2, max_radius: float, strength: float, lifetime: float, emitter: Node = null) -> void:
	position = pos
	radius = max(max_radius, 0.0)
	intensity = clamp(strength, 0.0, 1.0)
	decay_time = max(lifetime, 0.01)
	source = emitter

func advance(delta: float) -> bool:
	elapsed += delta
	return elapsed < decay_time

func progress() -> float:
	return clamp(elapsed / decay_time, 0.0, 1.0)

func current_radius() -> float:
	return radius * progress()

func current_intensity() -> float:
	return intensity * (1.0 - progress())
