extends Area2D

@onready var game_manager: Node = %GameManager

# Fungsi ini dipanggil ketika ada node yang memasuki area
func _on_body_entered(body: Node2D) -> void:
	# Cek apakah node yang masuk adalah bagian dari grup "main_character"
	if body.is_in_group("main_character"):
		# Untuk audio collected item
		AudioManagerGlobal.play_item_collected()
		# Hapus objek ini dari scene untuk menandai pengambilan item
		queue_free()

		# Pastikan game_manager terhubung sebelum menambah poin
		if game_manager:
			game_manager.add_point()
		else:
			print("Error: game_manager tidak ditemukan!")
