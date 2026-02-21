# res://Menus/EndScreen.gd
extends Control

<<<<<<< Updated upstream
@onready var label: Label = $Label

func _ready() -> void:
	var acc := 0.0
	if GlobalStrings.total > 0:
		acc = float(GlobalStrings.hits) / float(GlobalStrings.total) * 100.0

	label.text = "Hits: %d\nMisses: %d\nTotal: %d\nAccuracy: %.1f%%" % [
		GlobalStrings.hits, GlobalStrings.misses, GlobalStrings.total, acc
	]
=======
@onready var result_label: Label = $ResultLabel
@onready var win_panel: Control = $WinPanel
@onready var lose_panel: Control = $LosePanel

@onready var next_button: Button = $WinPanel/NextButton
@onready var win_retry_button: Button = $WinPanel/RetryButton
@onready var lose_retry_button: Button = $LosePanel/RetryButton
@onready var menu_button: Button = $LosePanel/MenuButton

const PASS_ACC: float = 0.60

func _ready() -> void:
	var acc: float = GlobalStrings.accuracy()
	var acc_pct: float = acc * 100.0
	var passed: bool = acc >= PASS_ACC

	result_label.text = "Hits: %d\nMisses: %d\nTotal: %d\nAccuracy: %.1f%%" % [
		GlobalStrings.hits, GlobalStrings.misses, GlobalStrings.total, acc_pct
	]

	win_panel.visible = passed
	lose_panel.visible = not passed

	# If there is no next level (ex: Level 3), hide Next
	if GlobalStrings.next_level_scene == "" or GlobalStrings.next_level_scene == null:
		next_button.visible = false

	next_button.pressed.connect(_on_next_pressed)
	win_retry_button.pressed.connect(_on_retry_pressed)
	lose_retry_button.pressed.connect(_on_retry_pressed)
	menu_button.pressed.connect(_on_menu_pressed)

func _on_next_pressed() -> void:
	if GlobalStrings.next_level_scene != "" and GlobalStrings.next_level_scene != null:
		get_tree().change_scene_to_file(GlobalStrings.next_level_scene)

func _on_retry_pressed() -> void:
	if GlobalStrings.current_level_scene != "" and GlobalStrings.current_level_scene != null:
		get_tree().change_scene_to_file(GlobalStrings.current_level_scene)

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/MainMenu.tscn")
>>>>>>> Stashed changes
