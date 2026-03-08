extends AudioStreamPlayer

var audio_background: AudioStream = preload("res://assets/sfx/background-audio.mp3")
var audio_1: AudioStream = preload("res://assets/sfx/background_in_game/audio_1.mp3")
var audio_2: AudioStream = preload("res://assets/sfx/background_in_game/audio_2.mp3")
var audio_3: AudioStream = preload("res://assets/sfx/background_in_game/audio_3.mp3")

var step_1: AudioStream = preload("res://assets/sfx/Steps_tiles-001.ogg")
var step_2: AudioStream = preload("res://assets/sfx/Steps_tiles-002.ogg")

var success_audio: AudioStream = preload("res://assets/sfx/success.mp3")
var item: AudioStream = preload("res://assets/sfx/collected_item/Item_collected_2.ogg")

# Node pemutar suara permanen
var sfx_item_player := AudioStreamPlayer.new()
var sfx_footstep_player := AudioStreamPlayer.new()
var sfx_success_player := AudioStreamPlayer.new()
var bg_audios := AudioStreamPlayer.new()

func _ready() -> void:
	# BGM utama
	stream = audio_background
	volume_db = -40.0 # Tambahkan ini untuk mengecilkan BGM (coba angka -10 sampai -20)
	
	# Memasukkan pemutar suara SFX ke dalam game sejak awal
	add_child(sfx_item_player)
	add_child(sfx_footstep_player)
	add_child(sfx_success_player)
	add_child(bg_audios)
	
	# Atur volume untuk masing-masing SFX (Gunakan angka minus agar pelan)
	sfx_item_player.volume_db = -8.0     # Mengecilkan suara item
	sfx_footstep_player.volume_db = -12.0 # Mengecilkan suara langkah kaki
	bg_audios.volume_db = -40.0

func play_music() -> void:
	if not playing:
		play()

func stop_music() -> void:
	stop()

func play_bg() -> void:
	print("Audio background utama aktif")
	var audios: Array[AudioStream] = [audio_1, audio_2, audio_3]
	bg_audios.stream = audios[randi() % audios.size()]
	bg_audios.play()

func play_footstep() -> void:
	var steps: Array[AudioStream] = [step_1, step_2]
	sfx_footstep_player.stream = steps[randi() % steps.size()]
	sfx_footstep_player.play()

func play_item_collected() -> void:
	print("Menjalankan suara item!")
	var items_sfx: Array[AudioStream] = [item]
	sfx_item_player.stream = items_sfx[randi() % items_sfx.size()]
	sfx_item_player.play()

func music_success() -> void:
	print("Audio Success")
	await get_tree().create_timer(1.0).timeout # Fixed timer, previous was -10 which is invalid
	sfx_success_player.stream = success_audio
	sfx_success_player.play()
