extends Area2D

var activated := false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("main_character") and not activated:
		activated = true
		
		GameManager.set_checkpoint(global_position)
		print("CHECKPOINT AKTIF 🔆")

# untuk commit ke github
