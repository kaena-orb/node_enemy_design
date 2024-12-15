extends Path2D

func move_point():
	var player_pos : Vector2 = get_tree().get_current_scene().get_player_pos()
	var point : Vector2
	point = curve.get_point_position(1)
	curve.set_point_position(1, Vector2(point.x, player_pos.y))
