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

func _physics_process(delta):
	var vect_movimiento = Vector2.ZERO
	vect_movimiento.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	vect_movimiento.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	match estado:
		MOVER:
			if vect_movimiento != Vector2.ZERO:
				self.direccion = vect_movimiento.normalized()
		
		INTERACTUAR:
			vect_movimiento = Vector2.ZERO
	
	velocidad = velocidad.move_toward(vect_movimiento*MAX_SPEED, ACELERACION*delta)
	velocidad = move_and_slide(velocidad)
	
	# Acciones
	if Input.is_action_just_pressed("ui_interact"):
		interactuar()

func set_direccion(val):
	direccion = val.normalized()
	$Interactuador.set_direccion(val)

func interactuar():
	$Interactuador.do_the_thing()


func _on_start_interaccion():
	estado = INTERACTUAR


func _on_end_interaccion():
	estado = MOVER