extends Area2D

var speed = 500
signal missed

func _process(delta):
	position.y += speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	emit_signal("missed")
	queue_free()