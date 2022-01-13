# Juego de 'EscapaMinas'
# Máquinas digitales 2020

# Ángel Talero
# Humberto Rueda
# Juan David Robledo

# Metadefiniciones

#Dirección del bitmap display ($global_dir)
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
mensajeBienvenida:	.asciiz	"NOTA: Muévete usando las teclas WASD\nBienvenido, seleccione modo de juego:\n"
opcionUno:			.asciiz "1. Fácil (16 minas)\n"
opcionDos:			.asciiz "2. Difícil (32 minas)\n"
seleccion:			.asciiz "Selecciona tu opción: "
mensajeVictoria:	.asciiz "\nHas ganado!\n"
mensajeMuerte:		.asciiz "\nHas perdido, inténta de nuevo!\n"
mensajeJugar:       .asciiz "Desea jugar otra vez? (s/n): "
mensajeError:       .asciiz "\nOpción incorrecta!, inténte otra vez!\n"

# La ejecución es secuencial y comienza en 'game.asm'
