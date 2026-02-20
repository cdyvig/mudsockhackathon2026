extends Node2D
@onready var startButton = $StartButton
@onready var level1 = $Level1Start
@onready var level2 = $Level2Start
@onready var level3 = $Level3Start
@onready var level4 = $Level4Start

func _on_start_button_pressed() -> void:
	startButton.hide()
	level1.show()
	level2.show()
	level3.show()
	level4.show()

func _on_level_1_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Level 1/Level 1.tscn")

func _on_level_2_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Level 2/level_2.tscn")

func _on_level_3_start_pressed() -> void:
	pass # Replace with function body.

func _on_level_4_start_pressed() -> void:
	pass # Replace with function body.
