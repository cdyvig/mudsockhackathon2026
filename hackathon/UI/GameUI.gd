extends CanvasLayer

@onready var score_label: Label = $ScoreLabel

func _process(_delta: float) -> void:
	score_label.text = "Hits: %d  Misses: %d  Total: %d" % [
		GlobalStrings.hits,
		GlobalStrings.misses,
		GlobalStrings.total
	]
