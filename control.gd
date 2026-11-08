extends Control

var points = 0
var update_price = 100
var multiplier = 1
var rebirth_cost = 5000
var rebirth_multiply = 1
var amount_of_upgrades = 0
var amount_of_rebirths = 0
var clicks = 0

@onready var displayer : Label = $Label
@onready var multiplierButton : Button = $multiplierButton
@onready var multiplierDisplay : Label = $multiplierCounter
@onready var rebirthPriceLabel : Label = $rebirthPriceLabel
@onready var statsLabel : Label = $statsLabel

func update_displayer() -> void:
	displayer.text = "You have %d Points!" %points
	multiplierButton.text = "%d Points" %update_price
	multiplierDisplay.text = "%dx" %(multiplier * 2)
	rebirthPriceLabel.text = "%d Points" %rebirth_cost
	statsLabel.text = "Upgrades: %d\nRebirths: %d\nClicks: %d" % [amount_of_upgrades, amount_of_rebirths, clicks]

func _on_button_pressed() -> void:
	points += (multiplier * rebirth_multiply)
	clicks += 1
	update_displayer()

func _on_multiplier_button_pressed() -> void:
	if points >= update_price:
		points -= update_price
		multiplier *= 2
		update_price = round(update_price * 2.25)
		amount_of_upgrades += 1
	update_displayer()

func _on_rebirth_button_pressed() -> void:
	if (points >= rebirth_cost):
		points = 0
		rebirth_cost *= 2
		rebirth_multiply *= 2
		multiplier = 1
		update_price = 100
		amount_of_rebirths += 1
	update_displayer()
