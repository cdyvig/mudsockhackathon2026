extends Control

@onready var label: Label = $Label

func _ready() -> void:
	var acc := 0.0
	if GlobalStrings.total > 0:
		acc = float(GlobalStrings.hits) / float(GlobalStrings.total) * 100.0

	label.text = "Hits: %d\nMisses: %d\nTotal: %d\nAccuracy: %.1f%%" % [
		GlobalStrings.hits, GlobalStrings.misses, GlobalStrings.total, acc
	]
