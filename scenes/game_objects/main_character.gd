extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -900.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

# Fungsi untuk melompat lurus ke atas
func jump():
	velocity.y = JUMP_VELOCITY

# Fungsi untuk melompat ke samping
func jump_side(x):
	velocity.y = JUMP_VELOCITY
	velocity.x = x

# Fungsi untuk memproses input dan fisika setiap frame
func _physics_process(delta: float) -> void:
	# Animasi bergerak
	if velocity.x > 1 or velocity.x < -1:
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"

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
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
