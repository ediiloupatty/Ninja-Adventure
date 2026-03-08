extends AudioStreamPlayer

var audio_background = preload("res://assets/sfx/background-audio.mp3")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stream = audio_background
	
func play_music() -> void:
	if not playing:
		play()

func stop_music()-> void:
	stop()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
