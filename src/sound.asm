# Sonidos y Música de juego
.text
SonidoIniciarJuego:
	#Reproducir sonido de inicio de juego (Duración: 2 segundos)

	#MIDI ASYNC
	li $v0, 31
	
	#Volumen, instrumentos y velocidad
	li $a3, 127
	li $a2, 88
	li $a1, 280
	
	#Primer acorde

		#Primera nota (C3)
		li $a0, 36
		syscall
		
		#Segunda nota (E)
		li $a0, 52
		syscall
		
		#Pause
		li $v0, 32
		li $a0, 280
		syscall
		li $v0, 31

    #Segundo acorde

		#Primera nota (D)
		li $a0, 38
		syscall
		
		#Segunda nota (F)
		li $a0, 53
		syscall
		
		#Pause
		li $v0, 32
		li $a0, 280
		syscall
		li $v0, 31

    #Tercer acorde

		#Primera nota (E)
		li $a0, 40
		syscall
		
		#Segunda nota (G)
		li $a0, 55
		syscall
		
		#Pause
		li $v0, 32
		li $a0, 280
		syscall
		li $v0, 31

    #Cuarto acorde

		#Primera nota (F)
		li $a0, 41
		syscall
		
		#Segunda nota (A)
		li $a0, 57
		syscall
		
		#Pause
		li $v0, 32
		li $a0, 280
		syscall
		li $v0, 31

    #Quinto acorde

		#Primera nota (G)
		li $a0, 43
		syscall
		
		#Segunda nota (B)
		li $a0, 59
		syscall
		
		#Pause
		li $v0, 32
		li $a0, 280
		syscall
		li $v0, 31

    #Sexto acorde
        li $a1, 1400
        
		#Primera nota (C3)
		li $a0, 36
		syscall
		
		#Segunda nota (C5)
		li $a0, 60
		syscall
		
		#Pause
		li $v0, 32
		li $a0, 600
		syscall
		li $v0, 31

	
	jr $ra
	
SonidoPerderJuego:
	#Reproducir sonido de inicio de juego

	#MIDI ASYNC
	li $v0, 31
	
	#Volumen, instrumentos y velocidad
	li $a3, 127
	li $a2, 88
	li $a1, 820
	
	#Primer acorde

		#Primera nota
		li $a0, 53
		syscall
		
		#Segunda nota
		li $a0, 56
		syscall
		
		#Tercera nota
		li $a0, 60
		syscall
		
		#Pause
		li $v0, 32
		li $a0, 800
		syscall
		li $v0, 31
		
	#Segundo acorde

		#Primera nota
		li $a0, 52
		syscall
		
		#Segunda nota
		li $a0, 55
		syscall
		
		#Tercera nota
		li $a0, 59
		syscall
		
		#Pause
		li $v0, 32
		li $a0, 800
		syscall
		li $v0, 31
		
	#Tercer acorde

		#Primera nota
		li $a0, 51
		syscall
		
		#Segunda nota
		li $a0, 54
		syscall
		
		#Tercera nota
		li $a0, 58
		syscall
		
		#Pause
		li $v0, 32
		li $a0, 800
		syscall
		li $v0, 31
	
	#Cuarto acorde
		li $a1, 2000

		#Primera nota
		li $a0, 50
		syscall
		
		#Segunda nota
		li $a0, 53
		syscall
		
		#Tercera nota
		li $a0, 57
		syscall
		
		#Pause
		li $v0, 32
		li $a0, 2000
		syscall
		li $v0, 31
		
	jr $ra

SonidoVictoriaJuego:
	#Reproducir sonido de Victoria

	#MIDI ASYNC
	li $v0, 31
	
	#Primer acorde (Bajo)

	    #Volumen, instrumentos y velocidad
	    li $a3, 127
	    li $a2, 88
	    li $a1, 3400

		#Primera nota (C4)
		li $a0, 48
		syscall
		
		#Segunda nota (G4)
		li $a0, 55
		syscall
		
		#Pause
		li $v0, 32
		li $a0, 600
		syscall
		li $v0, 31

    #Melodï¿½a
	    #Volumen, instrumentos y velocidad
	    li $a3, 127
	    li $a2, 88

		#Primera melodï¿½a
			li $a1, 200
			
			#Primera nota (C5)
			li $a0, 60
			syscall
		
			#Segunda nota (E)
			li $a0, 64
			syscall
		
			#Pause
			li $v0, 32
			li $a0, 200
			syscall
			li $v0, 31

		#Segunda melodï¿½a
        	li $a1, 2600

        	#Primera nota (C3)
			li $a0, 60
			syscall
		
			#Segunda nota (E)
			li $a0, 64
			syscall
			
			#Pause
			li $v0, 32
			li $a0, 2600
			syscall
			li $v0, 31
	
	jr $ra

