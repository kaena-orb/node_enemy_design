extends Node
class_name Movement

@export var random_parts_selection : bool
@export var one_shot : bool
@export var limbs : Array[Limb]
@export var body : Node2D
var completed : bool = false

var current_limb_index : int = 0

signal movement_finish
signal recoil
signal hit

func _ready():
	hit.connect(_on_hit)
	recoil.connect(_on_recoil)
	movement_finish.connect(_on_movement_finish)

func start_movement():
	if has_limbs() and random_parts_selection:
		shuffle_parts(limbs)

func next_limb() -> Limb:
	if not has_limbs():
		return null

	current_limb_index += 1

	if current_limb_index == limbs.size():
		if one_shot:
			complete_movement()
			movement_finish.emit()
			return null
		else:
			current_limb_index = 0

	return limbs[current_limb_index]

func get_current_limb() -> Limb:
	return limbs[current_limb_index]

func get_current_limb_tip() -> Marker2D:
	return get_current_limb().get_node("Tip")

func has_limbs() -> bool:
	return limbs.size() > 0

func shuffle_parts(parts : Array):
	parts.shuffle()

func _on_hit():
	pass

func _on_recoil():
	pass

func _on_movement_finish():
	pass

func complete_movement():
	completed = true

func get_enemy_body() -> Node2D:
	return get_parent()
