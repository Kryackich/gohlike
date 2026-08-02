extends Node2D

var turn : int = 0
var current_member
var is_player_turn = false
var player_basic = false
var player_special = false
var turn_time = true
var battle_ended = false
@onready var player = $"../Gplayer"
@onready var enemy = $"../Enemy"
@onready var members = [player, enemy]

func _ready() -> void:
	turn = 0
	var max_speed = 0
	for member in members:
		if member.stats["speed"] > max_speed:
			max_speed = member.stats["speed"]
			current_member = member
	
	if current_member == $"../Gplayer":
		print("player turn")
		is_player_turn = true
		
	else:
		print("enemy turn")
		
func _process(_delta: float) -> void:
	if not battle_ended:
		if is_player_turn and turn_time:
			if player_basic:
				player.basic(enemy)
				player_basic = false
				is_player_turn = false
				turn_time = false
				$TurnCooldown.start()
				
			if player_special and turn_time:
				player.special(enemy)
				player_special = false
				is_player_turn = false
				turn_time = false
				$TurnCooldown.start()
				
		elif not is_player_turn and turn_time:
			print("enemy turn")
			enemy.basic(player)
			is_player_turn = true
			$TurnCooldown.start()
			print("player turn")
			
		for member in members:
			if member.stats["hp"] <= 0:
				battle_ended = true
				print(str(member) + " Lose!")
	
func _on_canvas_layer_basic_pressed() -> void:
	if turn_time:
		player_basic = true

func _on_canvas_layer_special_pressed() -> void:
	if turn_time:
		player_special = true


func _on_turn_cooldown_timeout() -> void:
	turn_time = true
