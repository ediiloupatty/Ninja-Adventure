extends Area2D

@export var target_level: PackedScene

func _on_body_entered(body: Node2D) -> void:
	AudioManagerGlobal.music_success()
	if body.is_in_group("main_character"):
		get_tree().change_scene_to_packed(target_level)
