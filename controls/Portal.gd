extends Area2D

export(PackedScene) var escena
export(bool) var auto = true

func _ready():
	pass

func _on_entered(area):
	if auto:
		cargar()

func interact():
	cargar()

func cargar():
	get_tree().change_scene_to(escena)
