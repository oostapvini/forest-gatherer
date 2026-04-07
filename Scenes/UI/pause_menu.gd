extends CanvasLayer

class_name PauseMenu

@onready var settingsMenu : Settings = $Settings

func _ready() -> void:
	settingsMenu.back_pressed.connect(settingsToggle.bind(false))

func open() -> void:
	visible = true
	get_tree().paused = true

func close() -> void:
	visible = false
	get_tree().paused = false

func _on_resume_button_pressed() -> void:
	close()

func _on_settings_button_pressed() -> void:
	settingsMenu.visible = true
	$VBoxContainer.visible = false

func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/UI/MainMenu.tscn")

func settingsToggle(enable : bool) -> void:
	$VBoxContainer.visible = !enable
	settingsMenu.visible = enable
