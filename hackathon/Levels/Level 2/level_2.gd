extends Node2D
@onready var timer2: Timer = $"delay timer"
@onready var timer1: Timer = $"beat timer"
@onready var BString: Path2D = $BString
@onready var EString: Path2D = $EString
@onready var AString: Path2D = $AString
@onready var DString: Path2D = $DString
@onready var GString: Path2D = $GString
var activenotes = GlobalStrings.active_notes
var bpm = 120

func _ready() -> void:
	GlobalStrings.BString = BString
	GlobalStrings.EString = EString
	GlobalStrings.AString = AString
	GlobalStrings.DString = DString
	GlobalStrings.GString = GString
	timer2.start(2.29)
	await timer2.timeout
	GlobalStrings.createBnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(1.5)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(1)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(1.5)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(1.5)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createAnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.5)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createDnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()
	timer1.start(.25)
	await timer1.timeout
	GlobalStrings.createBnote()

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Strum"):
		GlobalStrings.createBnote()
		GlobalStrings.createEnote()
		GlobalStrings.createAnote()
		GlobalStrings.createDnote()
		GlobalStrings.createGnote()
		
		
	for note in activenotes:
		note.progress_ratio += delta / 2
		if note.progress_ratio >= 0.9999:
			activenotes.erase(note)
			note.queue_free()

func _on_timer_timeout() -> void:
	pass # Replace with function body.
