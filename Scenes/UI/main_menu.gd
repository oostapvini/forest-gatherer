extends CanvasLayer

class_name MainMenu

func _ready() -> void:
	$Settings.back_pressed.connect(settingsToggle.bind(false))

func _on_exit_button_pressed() -> void:
	get_tree().quit(0)

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/GameRoot.tscn")


func _on_settings_button_pressed() -> void:
	settingsToggle(true)

func settingsToggle(enable : bool) -> void:
	$VBoxContainer.visible = !enable
	$Settings.visible = enable
