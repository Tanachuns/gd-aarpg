class_name State_Attack extends State
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var attack: State_Attack = $"."
@onready var idle : State = $"../idle"
@onready var walk : State = $"../walk"
@onready var attack_effect: AnimationPlayer = $"../../Sprite2D/AttackEffectSprite/AnimationPlayer"
@onready var audio: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

@export  var move_speed : float = 100.0
@export var attack_sound : AudioStream
@export_range(1,20,0.5) var decelerate_speed: float = 5.0

var attacking: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func Enter() -> void:
	player.UpdateAnimation("attack")
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.5,0.9)
	audio.play()
	attack_effect.play("attack_"+player.AnimDirection())
	animation_player.animation_finished.connect(EndAttack)
	attacking = true
	pass


func  Exit() -> void:
	animation_player.animation_finished.disconnect(EndAttack)
	attacking = false
	
func  Process(_delta:float) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle 
		else:
			return walk
	return null
	
func  Physics(_delta:float) -> State:
	return null
	
func  HandleInput(_event:InputEvent) -> State:
	return null

func EndAttack(_newAnimation:String) -> void:
	attacking = false
	
