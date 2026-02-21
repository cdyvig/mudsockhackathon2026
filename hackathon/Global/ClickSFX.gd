extends Node

var _player: AudioStreamPlayer

func _ready() -> void:
	_player = AudioStreamPlayer.new()
	add_child(_player)

	_player.stream = load("res://Music/mouseclick sound affect.wav")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		_player.play()
