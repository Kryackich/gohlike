extends CanvasLayer

signal basic_pressed
signal special_pressed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_basic_pressed() -> void:
	basic_pressed.emit()

func _on_special_pressed() -> void:
	special_pressed.emit()
