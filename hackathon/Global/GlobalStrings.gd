extends Node

var BString: Path2D
var EString: Path2D
var AString: Path2D
var DString: Path2D
var GString: Path2D

var active_notes: Array[PathFollow2D] = []

func _make_note(parent_path: Path2D, texture_path: String, action_name: String, start_progress: float) -> void:
	var path := PathFollow2D.new()
	path.loop = false
	path.progress = start_progress

	var area := Area2D.new()
	area.monitoring = true
	area.add_to_group("notes")            # IMPORTANT

	var hitbox := CollisionShape2D.new()
	var shape := RectangleShape2D.new()
	shape.size = Vector2(60, 60)          # adjust to match your icon size
	hitbox.shape = shape

	var icon := Sprite2D.new()
	icon.texture = load(texture_path)
	icon.rotation = 7.0 * PI / 6.0

	# store required action on the Area so the bar can check it
	area.set_meta("action_name", action_name)

	parent_path.add_child(path)
	path.add_child(area)
	area.add_child(hitbox)
	area.add_child(icon)

	active_notes.append(path)

func createBnote() -> void:
	_make_note(BString, "res://Icons/B_Icon.PNG", "B String", 86)

func createEnote() -> void:
	_make_note(EString, "res://Icons/E_Icon.PNG", "E String", 45)

func createAnote() -> void:
	_make_note(AString, "res://Icons/A_Icon.PNG", "A String", 0)

func createDnote() -> void:
	_make_note(DString, "res://Icons/D_Icon.PNG", "D String", 21)

func createGnote() -> void:
	_make_note(GString, "res://Icons/G_Icon.PNG", "G String", 160)
