extends Node2D

var score: int = 0
var combo: int = 0
var health: float = 10.0
var max_health: float = 10.0
var is_game_over: bool = false

# Standard UI Node references
@onready var score_label = $UI/ScoreLabel
@onready var health_bar = $UI/HealthBar
@onready var combo_label = $UI/ComboLabel

func _ready():
	health = max_health

func _input(event):
	if is_game_over: return
	
	if event.is_action_pressed("1") or event.is_action_pressed("2") or event.is_action_pressed("3") or event.is_action_pressed("4"):
		check_note_hit()
	
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()

func check_note_hit():
	# Simple scoring logic before you added the fancy multipliers
	score += 10
	combo += 1
	update_ui()

func _on_note_missed():
	combo = 0
	health -= 1.0
	update_ui()
	if health <= 0:
		trigger_game_over()

func update_ui():
	if score_label: score_label.text = "Score: " + str(score)
	if combo_label: combo_label.text = "Combo: " + str(combo)
	if health_bar: health_bar.value = (health / max_health) * 100

func trigger_game_over():
	is_game_over = true
	print("Game Over")