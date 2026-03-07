extends RigidBody2D

@onready var game_manager: Node = %GameManager
# Kecepatan gerakan musuh
var speed: float = 100.0
# Batas gerakan ke kiri dan kanan relatif terhadap posisi awal musuh
var left_limit: float = -50.0
var right_limit: float = 50.0
# Menentukan arah awal gerakan musuh (1 untuk kanan, -1 untuk kiri)
var direction: int = 1
# Menyimpan posisi awal untuk referensi batas gerakan
var start_position_x: float




# Fungsi yang dipanggil saat node pertama kali masuk ke dalam scene tree
func _ready() -> void:
	start_position_x = position.x  # Simpan posisi X awal sebagai referensi
	add_to_group("enemies")  # Tambahkan musuh ke grup "enemies"

# Fungsi dipanggil setiap frame fisika untuk memperbarui posisi musuh
func _physics_process(delta: float) -> void:
	# Gerakkan musuh ke kiri atau kanan berdasarkan arah dan kecepatan
	position.x += direction * speed * delta
	
	# Cek apakah musuh sudah mencapai batas kiri atau kanan relatif terhadap posisi awal
	if position.x < start_position_x + left_limit:
		direction = 1  # Ubah arah ke kanan
	elif position.x > start_position_x + right_limit:
		direction = -1  # Ubah arah ke kiri

# Fungsi yang dipanggil ketika karakter pemain memasuki area musuh
func _on_area_2d_body_entered(body: Node2D) -> void:
	# Cek jika node yang memasuki area ini adalah bagian dari grup "main_character"
	if body.is_in_group("main_character"):
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x

		# Jika karakter utama berada di atas musuh, musuh mati
		if y_delta > 30:
			print("Membunuh Musuh")
			queue_free()
		else:
			# Jika tabrakan dari samping atau bawah, kurangi nyawa pemain
			print("Nyawa berkurang")
			game_manager.decrease_health()
			
			# Dorong karakter utama ke samping berdasarkan arah tabrakan
			if x_delta > 0:
				body.jump_side(500)
			else:
				body.jump_side(-500)



# Fungsi untuk memindahkan musuh ke arah tertentu
func move_in_direction(direction: Vector2) -> void:
	position += direction
