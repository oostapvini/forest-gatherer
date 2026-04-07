extends CanvasLayer

class_name Settings

signal back_pressed

@onready var volumeLabel : Label = $VBoxContainer/GridContainer/HBoxContainer/VolumeValueLabel
@onready var volumeSlider : HSlider = $VBoxContainer/GridContainer/HBoxContainer/VolumeSlider

func _on_back_pressed() -> void:
	back_pressed.emit()

func _on_value_changed(value: float) -> void:
	volumeLabel.text = str(value * 100) + "%"
