extends CanvasLayer

class_name PauseMenu

@onready var settingsMenu : Settings = $Settings
@onready var buttonsBox: VBoxContainer = $VBoxContainer

func _ready() -> void:
	settingsMenu.back_pressed.connect(settingsToggle.bind(false))
	
	visible = false
	settingsMenu.visible = false
	buttonsBox.visible = true

func open() -> void:
	get_tree().paused = true
	visible = true
	buttonsBox.visible = true
	settingsMenu.visible = false

func close() -> void:
	get_tree().paused = false
	visible = false
	buttonsBox.visible = true
	settingsMenu.visible = false

func _on_resume_button_pressed() -> void:
	close()

func _on_settings_button_pressed() -> void:
	settingsMenu.visible = true
	buttonsBox.visible = false

func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/UI/main_menu.tscn")

func settingsToggle(enable : bool) -> void:
	buttonsBox.visible = !enable
	settingsMenu.visible = enable
