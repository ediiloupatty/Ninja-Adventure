extends CharacterBody2D

const SPEED: float = 400.0
const JUMP_VELOCITY: float = -900.0
const FOOTSTEP_INTERVAL: float = 0.3

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var gm = GameManager

var footstep_timer: float = 0.0

func _ready() -> void:
	# spawn ke checkpoint
	if gm.last_checkpoint_position != Vector2.ZERO:
		global_position = gm.last_checkpoint_position
		
func jump_side(x: float) -> void:
	velocity.y = JUMP_VELOCITY
	velocity.x = x

func _physics_process(delta: float) -> void:

	# ANIMASI + FOOTSTEP
	if is_on_floor() and abs(velocity.x) > 1:
		sprite_2d.animation = "running"

		footstep_timer -= delta
		if footstep_timer <= 0.0:
			AudioManagerGlobal.play_footstep()
			footstep_timer = FOOTSTEP_INTERVAL
	else:
		if is_on_floor():
			sprite_2d.animation = "default"
		footstep_timer = 0.0

	# GRAVITY
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "jumping"

	# JUMP
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# MOVE
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 12)

	move_and_slide()

	sprite_2d.flip_h = velocity.x < 0

# ========================
# DIE & RESPAWN
# ========================
func die() -> void:
	print("Player mati 💀")

	velocity = Vector2.ZERO
	await get_tree().create_timer(0.3).timeout

	if gm.last_checkpoint_position != Vector2.ZERO:
		global_position = gm.last_checkpoint_position
	else:
		get_tree().reload_current_scene()
