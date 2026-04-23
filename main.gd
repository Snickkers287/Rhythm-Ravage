extends Node2D

var score: int = 0
var combo: int = 0
var health: float = 100.0
var game_over: bool = false

@onready var score_label = $UI/ScoreLabel
@onready var health_bar = $UI/HealthBar

func _input(event):
	if event.is_action_pressed("1") or event.is_action_pressed("2") or event.is_action_pressed("3") or event.is_action_pressed("4"):
		check_note_hit()
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()

func check_note_hit():
	score += 10
	combo += 1
	print("Hit! Score: ", score)

func spawn_note():
	pass