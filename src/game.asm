# Funciones para la ejecución del juego

.text
main: # Entry-point

	#Variables importantes
	#	$s0, Cantidad de minas
	#	$s1, Vector con la ubicaci??n de las minas
	#	$s3, Contador iniciado en 0
	#	$s4, Posici??n del jugador
	
	#Pintar toda la pantalla de blanco
	li $a0, DIR_BASE
	li $a1, BLANCO
	jal PintarPantalla
	
	#Mostrar el mensaje de Bienvenida y seleccionar modo de juego
	jal MostrarMensajeBienvenida
	
	#Calcular las minas
	la $s1, arrayMinas
	li $s3, 0
	jal CalcularMinas

	#Comprobar que las minas no se repitan
	li $s1, 0
	jal comprobarMinasIguales

	jal RestablecerVariables
	
	#Imprimir las minas y Reproducir musica de inicio durante 2 segundos
	la $s1, arrayMinas
	li $s3, 0
	jal PintarMinas
	
	#Pintar toda la pantalla de Negro
	li $a0, DIR_BASE
	li $a1, NEGRO
	jal PintarPantalla

	#Empezar juego
	j IniciarJuego
	
	#Fin del programa
	j end

RestablecerVariables:
	li $s1, 0
	li $s2, 0
	li $s3, 0
	li $s4, 0
	li $s5, 0
	li $s6, 0

	jr $ra

comprobarMinasIguales:
	#Cargar el array en $t1
	la $t1, arrayMinas
	#Contador
	mul $t0, $s1, 4

	add $t1, $t1, $t0
	lw $t0, 0($t1)

	#Guardar en t0 el contenido del vector
	add $s2, $s1, 1
	
	add $t4, $ra, $zero
	jal comprobarMinasIguales_bucle2
	add $ra, $t4, $zero

	add $s1, $s1, 1

	blt $s1, $s0, comprobarMinasIguales
	jr $ra

comprobarMinasIguales_bucle2:

	#Cargar el array
	la $t2, arrayMinas
	#Contador
	mul $t3, $s2, 4
	
	add $t2, $t2, $t3
	lw $t3, 0($t2)

	#Guardar en $t3 todo el contenido del vector

	beq $t3, $t0, cambiarNumeros

	add $s2, $s2, 1

	blt $s2, $s0, comprobarMinasIguales_bucle2
	jr $ra

cambiarNumeros:
	#Generar n�mero aleatorio
	
	li $v0, 42
	addi $a1, $zero, 253
	syscall
	
	#Sumarle 1
	add $a0, $a0, 1
	
	#muliplicarlo por 4
	mul $a0, $a0, 4
	
	#Guardarlo en el array
	sw $a0, 0($t2)

	add $ra, $t4, $zero
	li $s1, 0
	j comprobarMinasIguales

IniciarJuego:
	#Crear las variables de X y Y
	# $s5, posicion de X
	# $s6, posicion de Y

	li $s5, 0
	li $s6, 0

	#imprimir primera posicion
	li $t0, DIR_BASE
	li $t1, VERDE
	sw $t1, 0($t0)

	j moverJugador

moverJugador:

	#Movimiento del jugador

	#Leer el caracter
	li $v0, 12
	syscall

	#w/W
	beq $v0, 119, moverArriba
	beq $v0, 87, moverArriba

	#a/A
	beq $v0, 97, moverIzquierda
	beq $v0, 65, moverIzquierda

	#s/S
	beq $v0, 115, moverAbajo
	beq $v0, 83, moverAbajo

	#d/D
	beq $v0, 100, moverDerecha
	beq $v0, 68, moverDerecha

continuar_moverjugador:

	#Imprimir posici??n del jugador
	li $t0, DIR_BASE
	li $t1, VERDE

	#Imprimir
	add $t0, $t0, $s4
	sw $t1, 0($t0)

	#Comprobar si est� en una mina
	la $s1, arrayMinas
	li $s3, 0
	jal ComprobarJugadorMina

	#Comprobar si el jugador ya gan??
	beq $s4, 1020, PintarDibujoVictoria

	j moverJugador


moverArriba:
	#Imprimir la casilla actual de blanco
	li $t0, DIR_BASE
	li $t1, BLANCO

	add $t0, $t0, $s4
	sw $t1, 0($t0)

	#	$t0, posici??n provisional
	add $t0, $s6, -1

	blt $t0, 0, continuar_moverjugador

	#Calcular nueva posici??n
	# (y*64)+(x*4)

	add $s6, $s6, -1

	li $t2, 64
	mul $s4, $s6, $t2

	li $t2, 4
	mul $t3, $s5, $t2

	add $s4, $s4, $t3

	j continuar_moverjugador

moverAbajo:
	#Imprimir la casilla actual de blanco
	li $t0, DIR_BASE
	li $t1, BLANCO

	add $t0, $t0, $s4
	sw $t1, 0($t0)

	#	$t0, posici??n provisional
	add $t0, $s6, 1

	bgt $t0, 15, continuar_moverjugador

	#Calcular nueva posici??n
	# (y*64)+(x*4)

	li $t0, DIR_BASE
	li $t1, VERDE

	add $s6, $s6, 1

	li $t2, 64
	mul $s4, $s6, $t2

	li $t2, 4
	mul $t3, $s5, $t2

	add $s4, $s4, $t3

	j continuar_moverjugador

moverIzquierda:
	#Imprimir la casilla actual de blanco
	li $t0, DIR_BASE
	li $t1, BLANCO

	add $t0, $t0, $s4
	sw $t1, 0($t0)

	#	$t0, posici??n provisional
	add $t0, $s5, -1

	blt $t0, 0, continuar_moverjugador

	#Calcular nueva posici??n
	# (y*64)+(x*4)

	li $t0, DIR_BASE
	li $t1, VERDE

	add $s5, $s5, -1

	li $t2, 64
	mul $s4, $s6, $t2

	li $t2, 4
	mul $t3, $s5, $t2

	add $s4, $s4, $t3

	j continuar_moverjugador

moverDerecha:
	#Imprimir la casilla actual de blanco
	li $t0, DIR_BASE
	li $t1, BLANCO

	add $t0, $t0, $s4
	sw $t1, 0($t0)

	#	$t0, posici??n provisional
	add $t0, $s5, 1

	bgt $t0, 15, continuar_moverjugador

	#Calcular nueva posici??n
	# (y*64)+(x*4)

	li $t0, DIR_BASE
	li $t1, VERDE

	add $s5, $s5, 1

	li $t2, 64
	mul $s4, $s6, $t2

	li $t2, 4
	mul $t3, $s5, $t2

	add $s4, $s4, $t3

	j continuar_moverjugador

JugarDeNuevo:
	#Preguntarle al jugador si quiere jugar de nuevo
	li $v0, 4
	la $a0, mensajeJugar
	syscall

	#Leer la respuesta del jugador
	li $v0, 12
	syscall

	#s
	beq $v0, 115, main
	beq $v0, 83, main

	#n
	beq $v0, 110, end
	beq $v0, 78, end

	jal mostrarMensajeError2

	j JugarDeNuevo

ComprobarJugadorMina:
		#$s3 debe llegar iniciado en 0!! i = 0

	#Par�metros
	#	$s0 - Cantidad de minas
	#	$s1 - Arreglo con las minas
	#	$s3 - Contador iniciado en 0
	#	$s4 - Posici??n actual del jugador

	#Comparar cada una de las posiciones del vector $s1 con $s4

	#Contenido del for:
	lw $t0, 0($s1)
	beq $t0, $s4, PintarDibujoMuerte
	add $s1, $s1, 4

	#i++
	add $s3, $s3, 1
	# i < cantidad_minas
	blt $s3, $s0, ComprobarJugadorMina

	jr $ra
	
	
PintarMinas:
	#Par�metros
	#	$s0 - Cantidad de minas
	#	$s1 - Arreglo con las minas
	#
	#	$s3 - Contador iniciado en 0
	
	#Variables:
	#	$t0 - Direcci??n del bitmap display
	#	$t1 - Color a imprimir
	
	li $t0, DIR_BASE
	li $t1, ROJO

	#Cargar el n??mero en el array
	lw $a0, 0($s1)
	
	#Sumarle a la direcci??n base la posici??n de $a0
	add $t0, $t0, $a0
	
	#Pintar el cuadro
	sw $t1, 0($t0)
	
	
	#Suma contadores
	add $s1, $s1, 4
	add $s3, $s3, 1
	
	blt $s3, $s0, PintarMinas
	
	#Guardar $ra, y reproducir el sonido por 2 segundo
	add $t0, $ra, $zero
	jal SonidoIniciarJuego
	add $ra, $t0, $zero
	
	jr $ra
	
CalcularMinas:
	#Par�metros
	#	$s0 - Cantidad de minas
	#	$s1 - Arreglo con las minas
	#
	#	$s3 - Contador iniciado en 0

	#Generar un n??mero aleatorio
	#	desde 1 hasta 254 "(0 - 253) + 1" para que no pueda haber mina en el inicio ni en el final
	
	li $v0, 42
	addi $a1, $zero, 253
	syscall
	
	#Sumarle 1
	add $a0, $a0, 1
	
	#muliplicarlo por 4
	mul $a0, $a0, 4
	
	#Guardarlo en el array
	sw $a0, 0($s1)
	
	#Aumentar los contadores
	add $s1, $s1, 4
	add $s3, $s3, 1
	
	blt $s3, $s0, CalcularMinas
	
	li $s3, 0
	li $s4, 0

	#Guardar el vector en $s1
	la $s1, arrayMinas

	#Guardar el $ra
	add $t1, $ra, $zero

	#Bucle para confirmar que 2 minas no se repitan

	#Recuperar el $ra
	add $ra, $t1, $zero
	
	jr $ra

	
MostrarMensajeBienvenida:

	#Returns:
	#$s0, Cantidad de minas

	#Mostrar mensajes
	li $v0, 4
	
	la $a0, mensajeBienvenida
	syscall
	
	la $a0, opcionUno
	syscall
	
	la $a0, opcionDos
	syscall
	
	la $a0, seleccion
	syscall
	
	#Leer usuario
	li $v0, 5
	syscall

	#Mensaje error
	blt $v0, 1, mostrarMensajeError
	bgt $v0, 2, mostrarMensajeError
	
	#Guardar en $s0 la cantidad de minas
	add $s0, $v0, $zero
	
	#muliplicar la opci??n del usuario por 16 para obtener la cantidad de minas
	mul $s0, $s0, 16

	jr $ra

mostrarMensajeError:

	li $v0, 4
	la $a0, mensajeError
	syscall

	j MostrarMensajeBienvenida

mostrarMensajeError2:

	li $v0, 4
	la $a0, mensajeError
	syscall

	jr $ra

PintarPantalla:

	#Par�metros
	#$a0 - Direcci??n base
	#$a1 - Color a imprimir
	
	#$t0 lleva la cuenta de hasta donde imprimir
	li $t0, DIR_BASE
	add $t0, $t0, 1020
	
    sw $a1, 0($a0)
    add $a0, $a0, 4
    
    ble $a0, $t0, PintarPantalla
    jr $ra
	
end:
    li $v0, 10
    syscall
