extends CharacterBody2D

@export var walk_speed := 200.0
@export var crouch_speed := 110.0

@export var room_origin := Vector2.ZERO
@export var room_size := Vector2(1280, 720)
@export var room_padding := 12.0

@export var footstep_interval_walk := 0.45
@export var footstep_interval_crouch := 0.75
@export var footstep_radius_walk := 160.0
@export var footstep_radius_crouch := 90.0
@export var footstep_intensity_walk := 0.75
@export var footstep_intensity_crouch := 0.35

var _footstep_timer := 0.0

func _physics_process(delta: float) -> void:
	var input_vector := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var crouching := Input.is_action_pressed("crouch")
	var speed := crouch_speed if crouching else walk_speed

	velocity = input_vector * speed
	move_and_slide()

	_clamp_to_room()
	_emit_footsteps(delta, input_vector.length(), crouching)

func _emit_footsteps(delta: float, move_amount: float, crouching: bool) -> void:
	if move_amount < 0.1:
		_footstep_timer = 0.0
		return

	var interval := footstep_interval_crouch if crouching else footstep_interval_walk
	_footstep_timer += delta
	if _footstep_timer < interval:
		return

	_footstep_timer = 0.0
	var intensity := footstep_intensity_crouch if crouching else footstep_intensity_walk
	var radius := footstep_radius_crouch if crouching else footstep_radius_walk
	print("footstep intensity=", intensity, " radius=", radius)

func _clamp_to_room() -> void:
	var min_pos := room_origin + Vector2(room_padding, room_padding)
	var max_pos := room_origin + room_size - Vector2(room_padding, room_padding)
	global_position = global_position.clamp(min_pos, max_pos)
