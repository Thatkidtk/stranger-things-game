extends Node2D

const SoundEvent = preload("res://scripts/sound_event.gd")

@export var room_size := Vector2(1280, 720)
@export var room_color := Color(0.07, 0.07, 0.09, 1)
@export var border_color := Color(0.16, 0.16, 0.2, 1)
@export var border_width := 4.0
@export var debug_draw_sound := true
@export var sound_ring_width := 2.0
@export var sound_ring_segments := 64
@export var sound_alpha_floor := 0.15

var _sound_events: Array[SoundEvent] = []

func _ready() -> void:
	queue_redraw()

func _process(delta: float) -> void:
	var changed := _tick_sound_events(delta)
	if debug_draw_sound and (changed or _sound_events.size() > 0):
		queue_redraw()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("debug_toggle"):
		debug_draw_sound = not debug_draw_sound
		queue_redraw()

func _draw() -> void:
	var rect := Rect2(Vector2.ZERO, room_size)
	draw_rect(rect, room_color)
	draw_rect(rect, border_color, false, border_width)
	if debug_draw_sound:
		_draw_sound_events()

func emit_sound(position: Vector2, radius: float, intensity: float, decay_time: float, source: Node = null) -> void:
	_sound_events.append(SoundEvent.new(position, radius, intensity, decay_time, source))
	if debug_draw_sound:
		queue_redraw()

func emit_sound_from(source: Node2D, radius: float, intensity: float, decay_time: float) -> void:
	if source == null:
		return
	emit_sound(source.global_position, radius, intensity, decay_time, source)

func _tick_sound_events(delta: float) -> bool:
	var changed := false
	for index in range(_sound_events.size() - 1, -1, -1):
		var sound := _sound_events[index]
		if not sound.advance(delta):
			_sound_events.remove_at(index)
			changed = true
	return changed

func _draw_sound_events() -> void:
	for sound in _sound_events:
		var t := sound.progress()
		var alpha := max(sound_alpha_floor, 1.0 - t)
		var hue := lerp(0.55, 0.0, sound.intensity)
		var color := Color.from_hsv(hue, 0.8, 1.0, alpha)
		draw_arc(sound.position, sound.current_radius(), 0.0, TAU, sound_ring_segments, color, sound_ring_width, true)
