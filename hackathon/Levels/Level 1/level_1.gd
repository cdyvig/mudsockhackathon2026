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
	# assign paths
	GlobalStrings.BString = BString
	GlobalStrings.EString = EString
	GlobalStrings.AString = AString
	GlobalStrings.DString = DString
	GlobalStrings.GString = GString
	
	#pause button
	$PauseButton.process_mode = Node.PROCESS_MODE_ALWAYS
	$UnpauseButton.process_mode = Node.PROCESS_MODE_ALWAYS
	$BackButton.process_mode = Node.PROCESS_MODE_ALWAYS

	# reset score + notes list
	GlobalStrings.reset_score()
	GlobalStrings.active_notes.clear()

	# run chart async
	run_chart()

func run_chart() -> void:
	# --- chart (your current timing sequence) ---
	timer2.start(2.29)
	await timer2.timeout
	GlobalStrings.createAnote()

	timer1.start(2);   await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(2);   await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(1);   await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(1);   await timer1.timeout; GlobalStrings.createAnote()

	timer1.start(2);   await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(2);   await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(2);   await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(1);   await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(1);   await timer1.timeout; GlobalStrings.createBnote()

	timer1.start(2);   await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(1);   await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(1);   await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(1);   await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(1);   await timer1.timeout; GlobalStrings.createAnote()

	timer1.start(0.5); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(0.5); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(0.5); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(0.5); await timer1.timeout; GlobalStrings.createAnote()

	timer1.start(0.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(0.25); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(0.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(0.25); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(0.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(0.25); await timer1.timeout; GlobalStrings.createAnote()
	timer1.start(0.25); await timer1.timeout; GlobalStrings.createBnote()
	timer1.start(0.25); await timer1.timeout; GlobalStrings.createAnote()

	chart_done = true

func _physics_process(delta: float) -> void:
	# move notes safely
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
	# go to end screen when chart is done and no notes left
	if not end_triggered and chart_done and GlobalStrings.active_notes.size() == 0:
		end_triggered = true
		get_tree().change_scene_to_file("res://Menus/EndScreen.tscn")
		
	#update score
	score_label.text = str(GlobalStrings.hits) + " / " + str(GlobalStrings.hits + GlobalStrings.misses)
	

#menu buttons
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
