# level_2.gd (attach to Level2 Node2D)
extends Node2D

@onready var timer2: Timer = $"delay timer"
@onready var timer1: Timer = $"beat timer"

@onready var BString: Path2D = $BString
@onready var EString: Path2D = $EString
@onready var AString: Path2D = $AString
@onready var DString: Path2D = $DString
@onready var GString: Path2D = $GString

# normal UI (shown during gameplay)
@onready var score_display: TextureRect = $ScoreDisplay
@onready var score_label: Label = $ScoreLabel

# end UI (hidden until match ends)
@onready var score_display_2: TextureRect = $ScoreDisplay2
@onready var score_label_2: Label = $ScoreLabel2

var chart_done := false
var end_switched := false


func _ready() -> void:
	# assign paths
	GlobalStrings.BString = BString
	GlobalStrings.EString = EString
	GlobalStrings.AString = AString
	GlobalStrings.DString = DString
	GlobalStrings.GString = GString

	# pause/menu buttons always active
	$PauseButton.process_mode = Node.PROCESS_MODE_ALWAYS
	$UnpauseButton.process_mode = Node.PROCESS_MODE_ALWAYS
	$BackButton.process_mode = Node.PROCESS_MODE_ALWAYS

	# reset score + notes
	GlobalStrings.reset_score()
	GlobalStrings.active_notes.clear()

	# UI state at start
	score_display.show()
	score_label.show()
	score_display_2.hide()
	score_label_2.hide()

	# run chart async
	run_chart()


func run_chart() -> void:
	timer2.start(2.29)
	await timer2.timeout

	# --- YOUR LEVEL 2 CHART (unchanged) ---
	GlobalStrings.createBnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(1.5); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(1);   await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(1.4); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(1.4); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.24); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.4);  await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.24); await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.4);  await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.4);  await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.4);  await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.4);  await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.4);  await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.4);  await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.4);  await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.4);  await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.24); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.24); await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.24); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.4);  await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.5);  await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.24); await timer1.timeout; GlobalStrings.createDnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(.25); await timer1.timeout; GlobalStrings.createBnote()

	
	timer1.start(5)
	await timer1.timeout
	chart_done = true


func _physics_process(delta: float) -> void:
	for note in GlobalStrings.active_notes.duplicate():
		if not is_instance_valid(note):
			GlobalStrings.active_notes.erase(note)
			continue

		note.progress_ratio += delta / 2.0

		if note.progress_ratio >= 0.9999:
			GlobalStrings.register_miss()
			GlobalStrings.active_notes.erase(note)
			note.queue_free()


func _process(_delta: float) -> void:
	# update BOTH score labels so end UI is correct when it appears
	var txt := str(GlobalStrings.hits) + " / " + str(GlobalStrings.hits + GlobalStrings.misses)
	score_label.text = txt
	score_label_2.text = txt

	# when match ends, switch UI once
	if not end_switched and chart_done and GlobalStrings.active_notes.size() == 0:
		end_switched = true
		_switch_to_end_score_ui()


func _switch_to_end_score_ui() -> void:
	# hide normal UI
	score_display.hide()
	score_label.hide()

	# show end UI
	score_display_2.show()
	score_label_2.show()


func _on_pause_button_pressed() -> void:
	get_tree().paused = true
	$PauseButton.hide()
	$UnpauseButton.show()
	$BackButton.show()


func _on_unpause_button_pressed() -> void:
	get_tree().paused = false
	$PauseButton.show()
	$UnpauseButton.hide()
	$BackButton.hide()


func _on_back_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Menus/MainMenu.tscn")
