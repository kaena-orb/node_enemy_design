extends Movement
class_name LimbSlam

var rotation
var angle_to_player

func start_movement():
	var player_pos : Vector2 = get_tree().get_current_scene().get_player_pos()
	angle_to_player = get_current_limb_tip().position.angle_to(player_pos)

	if has_limbs():
		_hit()

func _hit():
	var tween = create_tween()
	tween.set_parallel()
	tween.tween_property(get_current_limb(), "rotation", get_current_limb().rotation + angle_to_player, 0.5).set_ease(Tween.EASE_OUT)
	tween.tween_property(get_current_limb(), "scale:y", 1, 0.5).set_ease(Tween.EASE_OUT)
	tween.connect("finished", emit_signal.bind("hit"))

func _recoil():
	var tween = create_tween()
	tween.set_parallel()
	tween.tween_property(get_current_limb(), "rotation", 0, 1).set_ease(Tween.EASE_OUT)
	tween.tween_property(get_current_limb(), "scale:y", 0.5, 1)
	tween.connect("finished", emit_signal.bind("recoil"))

func _on_hit():
	_recoil()

func _on_recoil():
	var limb = next_limb()
	if limb:
		start_movement()
