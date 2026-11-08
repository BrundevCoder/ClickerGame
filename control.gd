extends Control

var points = 0

@onready var displayer : Label = $Label

func update_displayer() -> void:
	displayer.text = "You have %d Points!" %points

func _on_button_pressed() -> void:
	points += 1
	update_displayer()
