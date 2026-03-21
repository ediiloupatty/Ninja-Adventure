extends Control

@onready var container = $DigitContainer

var atlas = preload("res://img/panel_points/pointts.png")
var digit_textures = []

var digit_width = 0
var digit_height = 0

func _ready():
	# ambil ukuran otomatis
	var texture_size = atlas.get_size()
	
	digit_width = texture_size.x / 10
	digit_height = texture_size.y

	# potong sprite sheet
	for i in range(10):
		var tex = AtlasTexture.new()
		tex.atlas = atlas
		tex.region = Rect2(i * digit_width, 0, digit_width, digit_height)
		
		digit_textures.append(tex)
		print(container)

	update_score(0)


func update_score(value):
	# hapus angka lama
	for child in container.get_children():
		child.queue_free()

	var score_str = str(value)

	# bikin angka baru
	for char in score_str:
		var digit = int(char)

		var tex_rect = TextureRect.new()
		tex_rect.texture = digit_textures[digit]
		tex_rect.custom_minimum_size = Vector2(digit_width, digit_height)

		container.add_child(tex_rect)
