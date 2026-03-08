extends CharacterBody2D

const SPEED: float = 400.0
const JUMP_VELOCITY: float = -900.0
const FOOTSTEP_INTERVAL: float = 0.3 # Jeda antar langkah dalam detik

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

# Variabel untuk footstep
var footstep_timer: float = 0.0

# Fungsi memproses fisika setiap frame
func _physics_process(delta: float) -> void:
	# Update logika animasi & footstep
	if is_on_floor() and (velocity.x > 1 or velocity.x < -1):
		sprite_2d.animation = "running"
		 	
		# Kurangi waktu timer dengan delta (waktu yang berlalu per frame)
		footstep_timer -= delta
		
		# Jika timer menyentuh 0 atau kurang, putar suara lalu reset timer-nya
		if footstep_timer <= 0.0:
			AudioManagerGlobal.play_footstep()
			footstep_timer = FOOTSTEP_INTERVAL
	else:
		# Kembalikan ke animasi idle jika di lantai dan tidak bergerak
		if is_on_floor():
			sprite_2d.animation = "default"
		
		# Reset timer saat mulai lari lagi agar suaranya pas
		footstep_timer = 0.0

	# Tambahkan gravitasi
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "jumping"

	# Tangani input loncatan
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Dapatkan arah input untuk pergerakan kiri/kanan
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 12)

	# Pindahkan karakter dengan pergerakan terhitung
	move_and_slide()
	
	# Balik sprite sesuai arah
	var is_left: bool = velocity.x < 0
	sprite_2d.flip_h = is_left

# Fungsi untuk melompat lurus ke atas
func jump() -> void:
	velocity.y = JUMP_VELOCITY

# Fungsi untuk melompat ke samping
func jump_side(x: float) -> void:
	velocity.y = JUMP_VELOCITY
	velocity.x = x
