extends StaticBody2D

const TEXTURA_APAGADA = preload("res://world/objetos/lareira/LareiraApagada.png")
const TEXTURA_ENCENDIDA = preload("res://world/objetos/lareira/LareiraEncendida.png")

export(bool) var encendida = false setget encender

func encender(val):
	encendida = val
	if encendida:
		$Sprite.texture = TEXTURA_ENCENDIDA
	else:
		$Sprite.texture = TEXTURA_APAGADA

func interact():
	self.encendida = not encendida
