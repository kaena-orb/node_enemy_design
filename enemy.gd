extends Node2D

var combat_started : bool = false
var max_length = 1
var recoiled_length = 0.5
var variation = 0.1
var initial_pos : Array[Vector2]
@export var movements : Array[Movement]

func _ready():
	pass

func start_movement():
	for movement in movements:
		if movement and not movement.completed:
			movement.start_movement()
			break

func _on_player_start_combat():
	if not combat_started:
		start_movement()
		combat_started = true

func _on_movement_finish():
	start_movement()
