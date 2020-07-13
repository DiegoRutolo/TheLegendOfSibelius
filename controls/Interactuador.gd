extends Position2D

signal start_interaccion
signal end_interaccion

export(int) var DISTANCIA = 30

var direccion = Vector2.DOWN setget set_direccion
var objs = []

func _ready():
	$Area2D/CollisionShape2D.position = Vector2(0, DISTANCIA)
	

func set_direccion(val):
	direccion = val.normalized()
	$Area2D/CollisionShape2D.position = direccion * DISTANCIA
	

func do_the_thing():
	if $Area2D.get_overlapping_bodies().size() > 0:
		$Area2D.get_overlapping_bodies()[0].interact()
	if $Area2D.get_overlapping_areas().size() > 0:
		$Area2D.get_overlapping_areas()[0].interact()
