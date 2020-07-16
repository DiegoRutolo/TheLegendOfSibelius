extends Node

const POS_INICIAL = Vector2(130, 146)

func _ready():
	call_deferred("init")

func init():
	$World.cargar_escena("res://world/cabana/CabanaInterior.tscn", POS_INICIAL, Vector2.DOWN)
