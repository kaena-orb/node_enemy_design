extends Movement
class_name Hit

@export var limbs : Array[Limb]
var current_limb = 0

func start_movement():
	if _has_limbs():
		_select_limb()
		_hit()

func _has_limbs() -> bool:
	return limbs.size() > 0

func _select_limb() -> Limb:
	var limb : Limb

	if random_parts_selection:
		var random_limb_index = randi() % limbs.size()
		limb = limbs[random_limb_index]
	else:
		current_limb += 1
		if current_limb == limbs.size():
			current_limb = 0
			limb = limbs[current_limb]
		else:
			limb = limbs[current_limb]

	return limb

func _hit():
	var tween = create_tween()
	tween.tween_property(limbs[current_limb], "scale:y", 1, 1)
	tween.connect("finished", _recoil)

func _recoil():
	var tween = create_tween()
	tween.tween_property(limbs[current_limb], "scale:y", 0.5, 1.5)
	tween.connect("finished", _reset)

func _reset():
	movement_finished.emit()
