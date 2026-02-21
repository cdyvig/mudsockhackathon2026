extends Area2D

@export var sfx: AudioStreamPlayer
@onready var timer: Timer = $"../HitTimer1"

var note_in_bar: Area2D = null

func _ready() -> void:
	monitoring = true
	collision_layer = 1
	collision_mask = 1
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	GlobalStrings.hit_timer = timer
	timer.set_one_shot(true)

func _process(_delta: float) -> void:
	if note_in_bar == null:
		return

	var action_name := str(note_in_bar.get_meta("action_name", ""))

	if action_name != "" and Input.is_action_just_pressed(action_name):
		if sfx:
			sfx.play()
		
		if timer.is_stopped():
			GlobalStrings.register_hit()
			timer.start(.001)

		var note_path := note_in_bar.get_parent() as PathFollow2D
		if note_path:
			GlobalStrings.active_notes.erase(note_path)
			note_path.queue_free()

		note_in_bar = null

func _on_area_entered(a: Area2D) -> void:
	if a.is_in_group("notes"):
		note_in_bar = a

func _on_area_exited(a: Area2D) -> void:
	if a == note_in_bar:
		note_in_bar = null
