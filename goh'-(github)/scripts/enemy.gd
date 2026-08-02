extends Node2D

const STATS = {"hp": 500, "speed": 100, "damage": 50}
var stats = {"hp": 500, "speed": 100, "damage": 50}
var current_turn_meter

func basic(target):
	target.stats["hp"] -= stats["damage"]
	print("enemy dealt " + str(stats["damage"]) + " damage")
	
func change_hp():
	$HealthBar.value = stats["hp"]
	
func change_turn_meter(amount):
	current_turn_meter += amount
	$TurnMeter.value = current_turn_meter

func _ready() -> void:
	$HealthBar.max_value = stats["hp"]
	
func _process(delta: float) -> void:
	change_hp()
	
