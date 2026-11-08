extends Control

var points = 0
var update_price = 100
var multiplier = 1

@onready var displayer : Label = $Label
@onready var multiplierButton : Button = $multiplierButton

func update_displayer() -> void:
	displayer.text = "You have %d Points!" %points
	multiplierButton.text = "%d Points" %update_price

func _on_button_pressed() -> void:
	points += multiplier
	update_displayer()

func _on_multiplier_button_pressed() -> void:
	if points >= update_price:
		points -= update_price
		multiplier *= 2
		update_price = round(update_price * 1.95)
