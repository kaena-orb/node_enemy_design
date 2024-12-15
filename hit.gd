extends Movement
class_name Hit

func start_movement():
	if has_limbs():
		_hit()

func _hit():
	var tween = create_tween()
	tween.tween_property(get_current_limb(), "scale:y", 1, 0.25)
	tween.connect("finished", emit_signal.bind("hit"))

func _recoil():
	var tween = create_tween()
	tween.tween_property(get_current_limb(), "scale:y", 0.5, 0.42)
	tween.connect("finished", emit_signal.bind("recoil"))

func _on_hit():
	_recoil()

func _on_recoil():
	var limb = next_limb()
	if limb:
		start_movement()
