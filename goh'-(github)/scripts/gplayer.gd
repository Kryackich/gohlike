extends Node2D

var stats = {"hp": 1000, "speed": 200, "damage": 100}
var current_turn_meter = 0

func basic(target):
	target.stats["hp"] -= stats["damage"]
	print("player dealt " + str(stats["damage"]) + " damage")
	
func special(target):
	print("used special" + str(target))

func change_hp():
	$HealthBar.value = stats["hp"]
	
func change_turn_meter(amount):
	current_turn_meter += amount
	$TurnMeter.value = current_turn_meter

func _ready() -> void:
	$HealthBar.max_value = stats["hp"]
	
func _process(delta: float) -> void:
	change_hp()
