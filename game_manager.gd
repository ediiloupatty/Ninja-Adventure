extends Node

@export var hearts: Array[Node]
var last_checkpoint_position: Vector2 = Vector2.ZERO

@onready var points_ui = %PointsLabel

var points: int = 0
var lives: int = 3

func _ready() -> void:
	AudioManagerGlobal.stop_music()
	AudioManagerGlobal.play_bg()

# ========================
# POINT SYSTEM
# ========================
func add_point() -> void:
	points += 1
	
	if points_ui.has_method("update_score"):
		points_ui.update_score(points)
	elif points_ui is Label:
		points_ui.text = "Points : " + str(points)

# ========================
# HEALTH SYSTEM
# ========================
func decrease_health() -> void:
	lives -= 1
	print("Lives:", lives)

	# update UI hati
	for h in range(hearts.size()):
		if h < lives:
			hearts[h].show()
		else:
			hearts[h].hide()

	if lives <= 0:
		var player = get_tree().get_first_node_in_group("main_character")
		if player:
			player.die()
		
		# Reset nyawa ke kondisi awal karena sudah pakai checkpoint
		lives = 3
		for h in range(hearts.size()):
			hearts[h].show()

# ========================
# CHECKPOINT SYSTEM
# ========================
func set_checkpoint(pos: Vector2) -> void:
	last_checkpoint_position = pos
	print("Checkpoint saved:", pos)

# untuk commit ke github
