extends KinematicBody2D

export(int) var max_speed = 50
export(int) var aceleracion = 100

var direccion := Vector2.ZERO setget set_direccion
var velocidad = Vector2.ZERO

func _physics_process(delta):
	velocidad = velocidad.move_toward(direccion*max_speed, aceleracion*delta)
	velocidad = move_and_slide(velocidad)

func set_direccion(val: Vector2):
	direccion = val.normalized()
