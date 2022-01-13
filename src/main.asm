# Juego de 'EscapaMinas'
# M�quinas digitales 2020

# �ngel Talero
# Humberto Rueda
# Juan David Robledo

# Metadefiniciones

#Direcci�n del bitmap display ($global_dir)
.eqv    DIR_BASE    0x10000000

#Colores para el bitmap display
.eqv    BLANCO      0x00FFFFFF
.eqv    NEGRO       0x00000000
.eqv    ROJO        0x00FF0000
.eqv    AZUL        0x000000FF
.eqv    VERDE       0x0000FF00

#includes
.include "game.asm"
.include "pixelart.asm"
.include "sound.asm"

.data
arrayMinas:			.space	128 #Espacio para guardar 32 int

# Mensajes de consola
mensajeBienvenida:	.asciiz	"NOTA: Mu�vete usando las teclas WASD\nBienvenido, seleccione modo de juego:\n"
opcionUno:			.asciiz "1. F�cil (16 minas)\n"
opcionDos:			.asciiz "2. Dif�cil (32 minas)\n"
seleccion:			.asciiz "Selecciona tu opci�n: "
mensajeVictoria:	.asciiz "\nHas ganado!\n"
mensajeMuerte:		.asciiz "\nHas perdido, int�nta de nuevo!\n"
mensajeJugar:       .asciiz "Desea jugar otra vez? (s/n): "
mensajeError:       .asciiz "\nOpci�n incorrecta!, int�nte otra vez!\n"

# La ejecuci�n es secuencial y comienza en 'game.asm'
