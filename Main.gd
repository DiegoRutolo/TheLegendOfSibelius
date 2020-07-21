extends Node

const POS_INICIAL = Vector2(130, 146)

export(PackedScene) var hud_game

var hud_instance

func _ready():
	PlayerStats.connect("hp_changed", self, "update_hud_hp")
	
	call_deferred("init_mundo")

func init_mundo():
	$World.cargar_escena("res://world/cabana/CabanaInterior.tscn", POS_INICIAL, Vector2.DOWN)
	hud_instance = hud_game.instance()
	$Gui.add_child(hud_instance)

func update_hud_hp():
	hud_instance.update_hp()
