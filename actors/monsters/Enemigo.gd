extends "res://actors/Actor.gd"

enum { BUSCAR, SEGUIR, ATACAR }

var MARGEN = 100

var estado
var destino = Vector2.ZERO
var pos_inicial: Vector2

func _ready():
	estado = BUSCAR
	$AnimationTree.active = false
	pos_inicial = position

func _physics_process(delta):
	match estado:
		BUSCAR:
			deambular()
		
		SEGUIR:
			pass
		
		ATACAR:
			pass

func deambular():
	self.direccion = position.direction_to(destino)

func set_direccion(val):
	direccion = val.normalized()
	if direccion.x >= 0:
		$AnimationPlayer.play("move_right")
	else:
		$AnimationPlayer.play("move_left")
	


func _on_Timer_timeout():
	destino = Vector2(
		rand_range(-MARGEN, MARGEN),
		rand_range(-MARGEN, MARGEN)
	) + position
