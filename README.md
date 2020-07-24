# The Legend of Sibelius

RPG en Godot


## Conceptos generales

Un par de definciones:

+ **Elementos**:
	+ Magia
	+ Luz
	+ Temperatura
	+ Vida
	+ Rayo
	+ Fuerza
	+ Movimiento
	+ Agua
	+ Tierra
	+ Piedra
	+ Metal
	+ Combinación

+ **Características**:
	+ Especie
	+ Raza
	+ Tamaño
	+ Color
	+ Elemento?

## Circulos y rituales

+ Los rituales permiten crear efectos mágicos sin gastar mana.
+ Pueden tener costes de materiales
+ Cada ritual tiene componentes principales
	+ Función:
		+ Dañar
			+ Elemento (la naturaleza del daño, cómo se hace)
			+ Magnitud
			+ Duración
		+ Proteger
			+ Elemento (de qué se quiere proteger el objetivo)
			+ Magnitud
			+ Duración
		+ Alterar
			+ Añadir
			+ Quitar
	+ Objetivo
		+ Item
			+ En el interior del círculo
		+ Entidad
			+ En el interior
			+ Más cercana
				+ Características (con/sin)
			+ Todas
				+ Características (con/sin)
				+ Distancia
		+ Ambiente
			+ Distancia
+ Cada ritual tiene componentes secundarios. Si no se especifican, son aleatorios. Pueden variar dependiendo de la función

+ El ritual está definido por 2 círculos concéntricos
+ El exterior indica la función
	+ Puede enlazar con otros círculos o simbolos para indicar los componentes secundarios
+ El interior indica el objetivo
+ Si no se mantiene la simetría del círculo es posible que éste falle (parcial, completa o catastróficamente)

### Ejemplos Rituales

'''
{
	Daño: {
		Elemento: luz,
		Magnitud: 8,
		Duracion: 9
	},
	Ambiente: {
		Rango: 10
	}
}
'''
Crea una luz que ilumina toda la sala y daña a las criaturas sensibles a la luz


## Hechizos

+ Los hechizos se pueden crear en rituales: Alterar Item
+ Se utiliza una piedra especial
	+ Se gasta con el uso
	+ Consume mana al usarlo
+ También tienen componentes.
	+ Forma [proyectil, burbuja, punto]
	+ Función [dañar, proteger, alterar]
	+ Elemento
+ Algunos componentes pueden ser incompatibles
+ En el caso de componentes incompatibles o sin especificar, serán aleatorios


