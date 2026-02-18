extends Node2D
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
