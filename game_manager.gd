extends Node

@onready var points_label: Label = %PointsLabel
@export var hearts: Array[Node]  # Daftar node hati yang merepresentasikan nyawa pemain

var points = 0
#terdapat 3 nyawa
var lives = 3


# Fungsi untuk mengurangi nyawa pemain
func decrease_health():
	lives -= 1
	print("Lives:", lives)
	# Perbarui tampilan hati sesuai dengan nyawa yang tersisa
	for h in range(hearts.size()):
		if h < lives:
			hearts[h].show()  # Tampilkan hati jika pemain masih memiliki nyawa
		else:
			hearts[h].hide()  # Sembunyikan hati jika nyawa berkurang
	
	# Jika nyawa habis, ulangi scene saat ini
	if lives <= 0:
		#code sebelumnya
		#get_tree().reload_current_scene()
		#code di ganti ke main menu
		get_tree().change_scene_to_file("res://scenes/menu/main_menu.tscn")


# Fungsi untuk menambah poin pemain
func add_point():
	points += 1
	print("Points:", points)
	points_label.text = "Points : " + str(points)



# Fungsi untuk menghapus semua musuh dari scene
func remove_all_enemies():
	get_tree().call_group("enemies", "queue_free")

# Fungsi untuk memindahkan semua musuh ke arah tertentu
func move_all_enemies(direction: Vector2):
	get_tree().call_group("enemies", "move_in_direction", direction)
