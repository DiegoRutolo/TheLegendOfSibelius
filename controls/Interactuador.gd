extends Position2D

signal start_interaccion
signal end_interaccion

var direccion = Vector2.DOWN setget set_direccion

func set_direccion(val):
	direccion = val.normalized()

func do_the_thing():
	$Area2D/CollisionShape2D.disabled = false
	if $Area2D.get_overlapping_areas().size() <= 0:
		$Area2D/CollisionShape2D.disabled = true
		return
	
	var obj = $Area2D.get_overlapping_areas()[0]
	
	
