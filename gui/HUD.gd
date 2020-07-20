extends CanvasLayer

func update_hp():
	$BarraSuperior/HP/Label.text = str(PlayerStats.hp)
