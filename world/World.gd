extends Node2D

var player
var primera_carga = true

func _ready():
	pass

func cargar_escena(ruta_escena, posicion, direccion):
	# Limpiamos los hijos
	for ninio in get_children():
		remove_child(ninio)
		ninio.free()
	
	# Cargamos la escena nueva
	var inst = load(ruta_escena).instance()
	self.add_child(inst)

	# Colocamos al jugador
	inst.player.position = posicion
	inst.player.direccion = direccion
	
