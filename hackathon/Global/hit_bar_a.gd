# res://Levels/Level 1/hit_bar.gd
# Attach this SAME script to HitBar_A, HitBar_B, HitBar_D, HitBar_E, HitBar_G
# Each note Area2D has meta: "action_name" (set in GlobalStrings._make_note)

extends Area2D

@export var sfx: AudioStreamPlayer

var note_in_bar: Area2D = null

func _ready() -> void:
	monitoring = true
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func _process(_delta: float) -> void:
	if note_in_bar == null:
		return
	if not is_instance_valid(note_in_bar):
		note_in_bar = null
		return

	# IMPORTANT: stops "counts by 4" when multiple hitbars see the same note
	if note_in_bar.get_meta("consumed", false):
		return

	var action_name := str(note_in_bar.get_meta("action_name", ""))
	if action_name == "":
		return

	if Input.is_action_just_pressed(action_name):
		# consume first so no other hitbar can score it this frame
		note_in_bar.set_meta("consumed", true)

		GlobalStrings.register_hit()

		if sfx:
			sfx.play()

		var note_path := note_in_bar.get_parent() as PathFollow2D
		if note_path:
			GlobalStrings.active_notes.erase(note_path)
			note_path.queue_free()

		note_in_bar = null

func _on_area_entered(a: Area2D) -> void:
	if a.is_in_group("notes"):
		# only track a note that hasn't already been hit
		if not a.get_meta("consumed", false):
			note_in_bar = a

func _on_area_exited(a: Area2D) -> void:
	if a == note_in_bar:
		note_in_bar = null
