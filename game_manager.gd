extends Node

@export var hearts: Array[Node] # Daftar node hati yang merepresentasikan nyawa pemain

@onready var points_ui = %PointsLabel

var points: int = 0
var lives: int = 3 # Terdapat 3 nyawa

# Fungsi untuk stop music ketika masuk ke dalam game
func _ready() -> void:
	AudioManagerGlobal.stop_music()
	AudioManagerGlobal.play_bg()
	

# Fungsi untuk menambah poin pemain
func add_point() -> void:
	points += 1
	print("Points: ", points)
	
	if points_ui.has_method("update_score"):
		points_ui.update_score(points)
	elif points_ui is Label:
		points_ui.text = "Points : " + str(points)

# Fungsi untuk mengurangi nyawa pemain
func decrease_health() -> void:
	lives -= 1
	print("Lives: ", lives)
	
	# Perbarui tampilan hati sesuai dengan nyawa yang tersisa
	for h in range(hearts.size()):
		if h < lives:
			hearts[h].show() # Tampilkan hati jika pemain masih memiliki nyawa
		else:
			hearts[h].hide() # Sembunyikan hati jika nyawa berkurang
	
	# Jika nyawa habis, ganti scene ke main menu
	if lives <= 0:
		get_tree().change_scene_to_file("res://scenes/menu/main_menu.tscn")

# Fungsi untuk menghapus semua musuh dari scene
func remove_all_enemies() -> void:
	get_tree().call_group("enemies", "queue_free")

# Fungsi untuk memindahkan semua musuh ke arah tertentu
func move_all_enemies(direction: Vector2) -> void:
	get_tree().call_group("enemies", "move_in_direction", direction)
