extends Area2D

signal cambio_escena(path_escena, posicion, direccion)

export(String) var path_destino
export(Vector2) var posicion
export(Vector2) var direccion

func _ready():
	pass

func _on_entered(area):
	cargar()

func cargar():
	#emit_signal("cambiar_escena", path_destino, posicion, direccion)
	get_tree().call_group("world_group", "cargar_escena", path_destino, posicion, direccion)
	
