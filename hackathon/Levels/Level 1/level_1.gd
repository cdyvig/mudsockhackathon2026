# res://Levels/Level 1/level_1.gd
# Attach to Level1 (Node2D)

extends Node2D

@onready var timer2: Timer = $"delay timer"
@onready var timer1: Timer = $"beat timer"

@onready var BString: Path2D = $BString
@onready var EString: Path2D = $EString
@onready var AString: Path2D = $AString
@onready var DString: Path2D = $DString
@onready var GString: Path2D = $GString

@onready var score_label: Label = $ScoreLabel

var chart_done := false
var end_triggered := false

func _ready() -> void:
	# tell EndScreen what "retry" and "next" mean for this level
	GlobalStrings.last_level = 1
	GlobalStrings.retry_level_path = "res://Levels/Level 1/Level 1.tscn"
	GlobalStrings.next_level_path  = "res://Levels/Level 2/Level 2.tscn"

	# assign paths
	GlobalStrings.BString = BString
	GlobalStrings.EString = EString
	GlobalStrings.AString = AString
	GlobalStrings.DString = DString
	GlobalStrings.GString = GString

	# pause buttons always work while paused
	$PauseButton.process_mode = Node.PROCESS_MODE_ALWAYS
	$UnpauseButton.process_mode = Node.PROCESS_MODE_ALWAYS
	$BackButton.process_mode = Node.PROCESS_MODE_ALWAYS

	# reset score + notes
	GlobalStrings.reset_score()
	GlobalStrings.active_notes.clear()

	# optional initial UI state
	$UnpauseButton.hide()
	$BackButton.hide()

	# run chart async
	run_chart()

func run_chart() -> void:
	timer2.start(2.29)
	await timer2.timeout
	GlobalStrings.createAnote()

	timer1.start(2);    await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(1.9);  await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(1);    await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(1);    await timer1.timeout; GlobalStrings.createAnote()

	timer1.start(2);    await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(1.9);  await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(2);    await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(1);    await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(1);    await timer1.timeout; GlobalStrings.createBnote()

	timer1.start(2);    await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(1);    await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(1);    await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(1);    await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(1);    await timer1.timeout; GlobalStrings.createAnote()

	timer1.start(0.5);  await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(0.5);  await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(0.5);  await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(0.4);  await timer1.timeout; GlobalStrings.createAnote()

	timer1.start(0.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(0.25); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(0.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(0.25); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(0.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(0.25); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(0.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(0.25); await timer1.timeout; GlobalStrings.createAnote()

	# give last notes time to reach hitbars
	timer1.start(5)
	await timer1.timeout
	chart_done = true

func _physics_process(delta: float) -> void:
	# move notes safely (handles notes freed by hitbars)
	for note in GlobalStrings.active_notes.duplicate():
		if not is_instance_valid(note):
			GlobalStrings.active_notes.erase(note)
			continue

		note.progress_ratio += delta / 2.0

		# MISS when it reaches the end
		if note.progress_ratio >= 0.9999:
			GlobalStrings.register_miss()
			GlobalStrings.active_notes.erase(note)
			note.queue_free()

func _process(_delta: float) -> void:
	# update score UI
	score_label.text = str(GlobalStrings.hits) + " / " + str(GlobalStrings.hits + GlobalStrings.misses)

	# go to EndScreen when chart is done and no notes left
	if not end_triggered and chart_done and GlobalStrings.active_notes.size() == 0:
		end_triggered = true
		get_tree().change_scene_to_file("res://Menus/EndScreen.tscn")

# --- pause/menu buttons ---
func _on_pause_button_pressed() -> void:
	get_tree().paused = true
	$UnpauseButton.show()
	$PauseButton.hide()
	$BackButton.show()

func _on_unpause_button_pressed() -> void:
	get_tree().paused = false
	$PauseButton.show()
	$UnpauseButton.hide()
	$BackButton.hide()

func _on_back_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Menus/MainMenu.tscn")
