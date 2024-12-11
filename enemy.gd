extends Node2D

var max_length = 1
var recoiled_length = 0.5
var variation = 0.1
@export var movements : Array[Movement]

func _ready():
	start_movement()

func start_movement():
	for movement in movements:
		movement.start_movement()

func _on_hit_movement_finished():
	start_movement()

func get_player_pos() -> Vector2:
	return $Player.position

func move_point():
	var point : Vector2 = $Path2D.curve.get_point_position(2)
	$Path2D.curve.set_point_position(2, get_player_pos())
