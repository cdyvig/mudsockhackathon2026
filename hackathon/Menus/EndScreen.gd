extends Control

@onready var win_panel: Control = $WinPanel
@onready var lose_panel: Control = $LosePanel

@onready var win_label: Label = $WinPanel/ResultLabel
@onready var lose_label: Label = $LosePanel/ResultLabel

@onready var next_button: Button = $WinPanel/NextButton
@onready var win_retry_button: Button = $WinPanel/RetryButton
@onready var lose_retry_button: Button = $LosePanel/RetryButton

const PASS_ACC := 0.60

func _ready() -> void:
	var acc := GlobalStrings.accuracy()
	var acc_pct := acc * 100.0

	var text := "Hits: %d\nMisses: %d\nTotal: %d\nAccuracy: %.1f%%" % [
		GlobalStrings.hits, GlobalStrings.misses, GlobalStrings.total, acc_pct
	]

	var passed := acc >= PASS_ACC

	win_panel.visible = passed
	lose_panel.visible = not passed

	if passed:
		win_label.text = text
		# if no next level, you can hide NextButton
		next_button.visible = GlobalStrings.next_level_path != ""
	else:
		lose_label.text = text

	# connect buttons
	next_button.pressed.connect(_on_next_pressed)
	win_retry_button.pressed.connect(_on_retry_pressed)
	lose_retry_button.pressed.connect(_on_retry_pressed)

func _on_next_pressed() -> void:
	if GlobalStrings.next_level_path != "":
		get_tree().change_scene_to_file(GlobalStrings.next_level_path)

func _on_retry_pressed() -> void:
	if GlobalStrings.retry_level_path != "":
		get_tree().change_scene_to_file(GlobalStrings.retry_level_path)
