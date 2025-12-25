extends Node2D

@export var room_size := Vector2(1280, 720)
@export var room_color := Color(0.07, 0.07, 0.09, 1)
@export var border_color := Color(0.16, 0.16, 0.2, 1)
@export var border_width := 4.0

func _ready() -> void:
	queue_redraw()

func _draw() -> void:
	var rect := Rect2(Vector2.ZERO, room_size)
	draw_rect(rect, room_color)
	draw_rect(rect, border_color, false, border_width)
