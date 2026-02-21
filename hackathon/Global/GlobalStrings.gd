extends Node

@export var click_stream: AudioStream

var BString: Path2D
var EString: Path2D
var AString: Path2D
var DString: Path2D
var GString: Path2D

var active_notes: Array[PathFollow2D] = []

var hits: int = 0
var misses: int = 0
var total: int = 0
var hit_timer: Timer = Timer.new()

#scoring
func reset_score() -> void:
	hits = 0
	misses = 0
	total = 0

func register_spawn() -> void:
	total += 1

func register_hit() -> void:
	hits += 1
	hit_timer.start(0.5)

func register_miss() -> void:
	misses += 1

#notes
func _make_note(parent_path: Path2D, texture_path: String, action_name: String, start_progress: float) -> void:
	if parent_path == null:
		return

	var path := PathFollow2D.new()
	path.loop = false
	path.progress = start_progress

	var area := Area2D.new()
	area.monitoring = true
	area.add_to_group("notes")

	var hitbox := CollisionShape2D.new()
	var shape := RectangleShape2D.new()
	shape.size = Vector2(40, 40)
	hitbox.shape = shape

	var icon := Sprite2D.new()
	icon.texture = load(texture_path)
	icon.rotation = 7.0 * PI / 6.0

	area.set_meta("action_name", action_name)

	parent_path.add_child(path)
	path.add_child(area)
	area.add_child(hitbox)
	area.add_child(icon)

	active_notes.append(path)
	register_spawn()

func createBnote() -> void:
	_make_note(BString, "res://Icons/B_Icon.PNG", "B String", 0)

func createEnote() -> void:
	_make_note(EString, "res://Icons/E_Icon.PNG", "E String", 0)

func createAnote() -> void:
	_make_note(AString, "res://Icons/A_Icon.PNG", "A String", 0)

func createDnote() -> void:
	_make_note(DString, "res://Icons/D_Icon.PNG", "D String", 0)

func createGnote() -> void:
	_make_note(GString, "res://Icons/G_Icon.PNG", "G String", 0)
	
	
