extends Node2D

class_name GameRoot

@export_file("*.tscn") var start_level_path: String

@onready var levelHolder = $LevelHolder

var current_level: Node = null

func _ready() -> void:
	if start_level_path != "":
		load_level(start_level_path)

			
func load_level(level_path: String) -> void:
	if current_level != null:
		current_level.queue_free()
		current_level = null

	var level_scene: PackedScene = load(level_path)
	if level_scene == null:
		push_error("Cannot load level: " + level_path)
		return

	current_level = level_scene.instantiate()
	levelHolder.add_child(current_level)

func reload_current_level() -> void:
	if current_level == null:
		return

	var scene_path := current_level.scene_file_path
	if scene_path == "":
		push_error("Current level has no scene_file_path")
		return

	load_level(scene_path)
