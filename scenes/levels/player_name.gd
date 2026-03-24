extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.player_name == "":
		text = "Welcome Player"
	else :
		text = Global.player_name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
