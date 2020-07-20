extends KinematicBody2D

enum {
	MOVER,
	INTERACTUAR
}

export(int) var MAX_SPEED = 100
export(int) var ACELERACION = 100

var estado = MOVER
var velocidad = Vector2.ZERO
var direccion = Vector2.DOWN setget set_direccion

onready var animation_state = $AnimationTree.get("parameters/playback")

func _ready():
	$AnimationTree.active = true

func _physics_process(delta):
	var vect_movimiento = Vector2.ZERO
	vect_movimiento.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	vect_movimiento.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	vect_movimiento = vect_movimiento.normalized()
	
	match estado:
		MOVER:
			if vect_movimiento != Vector2.ZERO:
				self.direccion = vect_movimiento.normalized()
				animation_state.travel("Walk")
			else:
				animation_state.travel("Idle")
		
		_:
			vect_movimiento = Vector2.ZERO
	
	# Movimiento
	velocidad = velocidad.move_toward(vect_movimiento*MAX_SPEED, ACELERACION*delta)
	velocidad = move_and_slide(velocidad)
	
	# Acciones
	if Input.is_action_just_pressed("ui_interact"):
		$Interactuador.do_the_thing()

func set_direccion(val):
	direccion = val.normalized()
	$Interactuador.direccion = direccion
	$AnimationTree.set("parameters/Idle/blend_position", direccion)
	$AnimationTree.set("parameters/Walk/blend_position", direccion)

func danhar(val: int):
	PlayerStats.hp -= val

func _on_start_interaccion():
	estado = INTERACTUAR

func _on_end_interaccion():
	estado = MOVER


func _on_Hurtbox_area_entered(area):
	danhar(area.danho)


func _on_Hurtbox_body_entered(body):
	danhar(body.danho)
