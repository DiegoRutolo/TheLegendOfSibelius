extends Node

signal dead
signal hp_changed

enum {
	DES, FUE, CON, CAR, INT, SAB
}

var atrib = {
	DES: 30,
	FUE: 30,
	CON: 30,
	CAR: 30,
	INT: 40,
	SAB: 50
}

var HP_MAX = atrib[CON] * 5
var hp = HP_MAX setget set_hp

func set_hp(val):
	hp = val
	emit_signal("hp_changed")
	
	if hp <= 0:
		emit_signal("dead")
