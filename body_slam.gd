extends Movement
class_name BodySlam
var initial_position : Vector2


func start_movement():
	_hit()

func _hit():
	#initial_position = get_enemy_body().position
	initial_position = body.position
	var player_pos : Vector2 = get_tree().get_current_scene().get_player_pos()
	var tween = create_tween()
	tween.tween_property(get_enemy_body(), "position", player_pos, 1)
	#tween.tween_property(get_current_limb(), "scale:y", 1, 0.25)
	tween.connect("finished", emit_signal.bind("hit"))

func _recoil():
	var tween = create_tween()
	tween.tween_property(get_enemy_body(), "position", initial_position, 1)
	tween.connect("finished", emit_signal.bind("recoil"))

func _on_hit():
	_recoil()

func _on_recoil():
	complete_movement()
	movement_finish.emit()
