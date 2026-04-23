extends Node

var bpm: int = 120
var sec_per_beat: float = 60.0 / bpm
var song_position: float = 0.0
var song_position_in_beats: float = 0.0
var last_reported_beat: int = 0
var beats_before_start: int = 0

@onready var audio_player = $AudioStreamPlayer

signal beat(index)

func _ready():
	sec_per_beat = 60.0 / bpm

func _process(_delta):
	if audio_player.playing:
		song_position = audio_player.get_playback_position() + AudioServer.get_time_since_last_mix()
		song_position -= AudioServer.get_output_latency()
		song_position_in_beats = song_position / sec_per_beat
		_report_beat()

func _report_beat():
	if int(song_position_in_beats) > last_reported_beat:
		last_reported_beat = int(song_position_in_beats)
		emit_signal("beat", last_reported_beat)

func start_song():
	audio_player.play()