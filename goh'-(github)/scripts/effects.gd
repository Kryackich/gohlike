extends Node

@abstract class Effect:
	func _init(name, duration) -> void:
		self.name = name
		self.duration = duration
		
	@abstract func aply(target)
	
	
class DmgUp extends Effect:
	func _init(name, duration) -> void:
		super._init(name, duration)
		
	func aply(target):
		target.stats["damage"] -= target.stats["damage"]*0.5
		
	
