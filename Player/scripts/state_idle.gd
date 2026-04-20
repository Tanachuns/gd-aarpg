class_name State_Idle extends State

@onready var walk : State = $"../walk"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func Enter() -> void:
	player.UpdateAnimation("idle")
	pass

func  Exit() -> void:
	pass
	
func  Process(_delta:float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null
	
func  Physics(_delta:float) -> State:
	return null
	
func  HandleInput(_delta:float) -> State:
	return null
