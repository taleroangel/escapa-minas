# Instrucciones para dibujar el pixelart en pantalla

.text
PintarDibujoVictoria:

	#Salvar $ra
	add $t1, $ra, $zero
	
	#Pintar toda la pantalla de azul
	li $a0, DIR_BASE
	li $a1, 0x004472C4
	jal PintarPantalla
	
	#Recuperar $ra
	add $ra, $t1, $zero
	
	#Imprimir el pixelArt
	li $t0, DIR_BASE

	#Contorno copa
	li $t1, NEGRO

	sw $t1, 12($t0)
	sw $t1, 16($t0)
	sw $t1, 20($t0)
	sw $t1, 24($t0)
	sw $t1, 28($t0)
	sw $t1, 32($t0)
	sw $t1, 36($t0)
	sw $t1, 40($t0)
	sw $t1, 44($t0)
	sw $t1, 48($t0)
	sw $t1, 52($t0)
	sw $t1, 68($t0)
	sw $t1, 72($t0)
	sw $t1, 76($t0)
	sw $t1, 116($t0)
	sw $t1, 120($t0)
	sw $t1, 124($t0)
	sw $t1, 132($t0)
	sw $t1, 140($t0)
	sw $t1, 180($t0)
	sw $t1, 188($t0)
	sw $t1, 196($t0)
	sw $t1, 204($t0)
	sw $t1, 244($t0)
	sw $t1, 252($t0)
	sw $t1, 260($t0)
	sw $t1, 268($t0)
	sw $t1, 308($t0)
	sw $t1, 316($t0)
	sw $t1, 324($t0)
	sw $t1, 328($t0)
	sw $t1, 332($t0)
	sw $t1, 372($t0)
	sw $t1, 376($t0)
	sw $t1, 380($t0)
	sw $t1, 400($t0)
	sw $t1, 432($t0)
	sw $t1, 468($t0)
	sw $t1, 492($t0)
	sw $t1, 536($t0)
	sw $t1, 552($t0)
	sw $t1, 604($t0)
	sw $t1, 612($t0)
	sw $t1, 668($t0)
	sw $t1, 676($t0)
	sw $t1, 732($t0)
	sw $t1, 740($t0)
	sw $t1, 792($t0)
	sw $t1, 796($t0)
	sw $t1, 804($t0)
	sw $t1, 808($t0)
	sw $t1, 852($t0)
	sw $t1, 876($t0)
	sw $t1, 916($t0)
	sw $t1, 940($t0)
	sw $t1, 980($t0)
	sw $t1, 984($t0)
	sw $t1, 988($t0)
	sw $t1, 992($t0)
	sw $t1, 996($t0)
	sw $t1, 1000($t0)
	sw $t1, 1004($t0)

	#Amarillos oscuros
	li $t1, 0x00FEC802

	sw $t1, 80($t0)
	sw $t1, 84($t0)
	sw $t1, 144($t0)
	sw $t1, 148($t0)
	sw $t1, 208($t0)
	sw $t1, 212($t0)
	sw $t1, 272($t0)
	sw $t1, 276($t0)
	sw $t1, 336($t0)
	sw $t1, 340($t0)
	sw $t1, 404($t0)
	sw $t1, 408($t0)
	sw $t1, 472($t0)
	sw $t1, 540($t0)
	sw $t1, 856($t0)
	sw $t1, 920($t0)
	sw $t1, 924($t0)
	sw $t1, 928($t0)
	sw $t1, 932($t0)
	sw $t1, 936($t0)

	#Amarillos ClarosD
	li $t1, 0x00FFFF00

	sw $t1, 88($t0)
	sw $t1, 92($t0)
	sw $t1, 96($t0)
	sw $t1, 100($t0)
	sw $t1, 104($t0)
	sw $t1, 108($t0)
	sw $t1, 112($t0)
	sw $t1, 152($t0)
	sw $t1, 156($t0)
	sw $t1, 160($t0)
	sw $t1, 164($t0)	
	sw $t1, 168($t0)
	sw $t1, 176($t0)
	sw $t1, 216($t0)
	sw $t1, 220($t0)
	sw $t1, 224($t0)
	sw $t1, 228($t0)
	sw $t1, 232($t0)
	sw $t1, 240($t0)
	sw $t1, 280($t0)
	sw $t1, 284($t0)
	sw $t1, 288($t0)
	sw $t1, 292($t0)
	sw $t1, 296($t0)
	sw $t1, 304($t0)
	sw $t1, 344($t0)
	sw $t1, 348($t0)
	sw $t1, 352($t0)
	sw $t1, 356($t0)
	sw $t1, 360($t0)
	sw $t1, 364($t0)
	sw $t1, 368($t0)
	sw $t1, 412($t0)
	sw $t1, 416($t0)
	sw $t1, 420($t0)
	sw $t1, 424($t0)
	sw $t1, 428($t0)
	sw $t1, 476($t0)
	sw $t1, 480($t0)
	sw $t1, 484($t0)
	sw $t1, 488($t0)
	sw $t1, 544($t0)
	sw $t1, 548($t0)
	sw $t1, 608($t0)
	sw $t1, 672($t0)
	sw $t1, 736($t0)
	sw $t1, 800($t0)
	sw $t1, 860($t0)
	sw $t1, 864($t0)
	sw $t1, 868($t0)
	sw $t1, 872($t0)

	#Reflejo blanco
	li $t1, BLANCO

	sw $t1, 172($t0)
	sw $t1, 236($t0)
	sw $t1, 300($t0)

	#Mostrar mensaje de Victoria por Consola	
	li $v0, 4
	la $a0, mensajeVictoria
	syscall
	
	#Guardar $ra y Reproducir sonido de muerte
	add $t0, $ra, $zero
	jal SonidoVictoriaJuego
	add $ra, $t0, $zero
	
	j JugarDeNuevo
	
PintarDibujoMuerte:
	
	#Salvar $ra
	add $t1, $ra, $zero
	
	#Pintar toda la pantalla de rojo
	li $a0, DIR_BASE
	li $a1, ROJO
	jal PintarPantalla
	
	#Recuperar $ra
	add $ra, $t1, $zero
	
	#Imprimir el pixelArt
	li $t0, DIR_BASE
	
	#Contorno calavera
	li $t1, NEGRO
	sw $t1, 76($t0)
	sw $t1, 80($t0)
	sw $t1, 84($t0)
	sw $t1, 88($t0)
	sw $t1, 92($t0)
	sw $t1, 96($t0)
	sw $t1, 100($t0)
	sw $t1, 104($t0)
	sw $t1, 108($t0)
	sw $t1, 112($t0)
	sw $t1, 136($t0)
	sw $t1, 180($t0)
	sw $t1, 196($t0)
	sw $t1, 248($t0)
	sw $t1, 260($t0)
	sw $t1, 312($t0)
	sw $t1, 320($t0)
	sw $t1, 380($t0)
	sw $t1, 384($t0)
	sw $t1, 396($t0)
	sw $t1, 400($t0)
	sw $t1, 404($t0)
	sw $t1, 424($t0)
	sw $t1, 428($t0)
	sw $t1, 432($t0)
	sw $t1, 444($t0)
	sw $t1, 448($t0)
	sw $t1, 460($t0)
	sw $t1, 464($t0)
	sw $t1, 468($t0)
	sw $t1, 488($t0)
	sw $t1, 492($t0)
	sw $t1, 496($t0)
	sw $t1, 508($t0)
	sw $t1, 512($t0)
	sw $t1, 528($t0)
	sw $t1, 532($t0)
	sw $t1, 540($t0)
	sw $t1, 544($t0)
	sw $t1, 552($t0)
	sw $t1, 556($t0)
	sw $t1, 572($t0)
	sw $t1, 580($t0)
	sw $t1, 604($t0)
	sw $t1, 608($t0)
	sw $t1, 632($t0)
	sw $t1, 644($t0)
	sw $t1, 668($t0)
	sw $t1, 672($t0)
	sw $t1, 696($t0)
	sw $t1, 712($t0)
	sw $t1, 716($t0)
	sw $t1, 752($t0)
	sw $t1, 756($t0)
	sw $t1, 784($t0)
	sw $t1, 792($t0)
	sw $t1, 804($t0)
	sw $t1, 812($t0)
	sw $t1, 848($t0)
	sw $t1, 856($t0)
	sw $t1, 868($t0)
	sw $t1, 876($t0)
	sw $t1, 916($t0)
	sw $t1, 920($t0)
	sw $t1, 924($t0)
	sw $t1, 928($t0)
	sw $t1, 932($t0)
	sw $t1, 936($t0)

	#Sombras grises
	li $t1, 0x00DBDBDB
	sw $t1, 140($t0)
	sw $t1, 144($t0)
	sw $t1, 148($t0)
	sw $t1, 152($t0)
	sw $t1, 156($t0)
	sw $t1, 160($t0)
	sw $t1, 164($t0)
	sw $t1, 168($t0)
	sw $t1, 172($t0)
	sw $t1, 176($t0)
	sw $t1, 200($t0)
	sw $t1, 244($t0)
	sw $t1, 264($t0)
	sw $t1, 308($t0)
	sw $t1, 324($t0)
	sw $t1, 376($t0)
	sw $t1, 388($t0)
	sw $t1, 440($t0)
	sw $t1, 452($t0)
	sw $t1, 504($t0)
	sw $t1, 516($t0)
	sw $t1, 568($t0)
	sw $t1, 584($t0)
	sw $t1, 628($t0)
	sw $t1, 648($t0)
	sw $t1, 652($t0)
	sw $t1, 688($t0)
	sw $t1, 692($t0)
	sw $t1, 720($t0)
	sw $t1, 744($t0)
	sw $t1, 748($t0)
	sw $t1, 788($t0)
	sw $t1, 808($t0)
	sw $t1, 872($t0)
	sw $t1, 852($t0)

	#Partes blancas
	li $t1, BLANCO
	sw $t1, 204($t0)
	sw $t1, 208($t0)
	sw $t1, 212($t0)
	sw $t1, 216($t0)
	sw $t1, 220($t0)
	sw $t1, 224($t0)
	sw $t1, 228($t0)
	sw $t1, 232($t0)
	sw $t1, 236($t0)
	sw $t1, 240($t0)
	sw $t1, 268($t0)
	sw $t1, 272($t0)
	sw $t1, 276($t0)
	sw $t1, 280($t0)
	sw $t1, 284($t0)
	sw $t1, 288($t0)
	sw $t1, 292($t0)
	sw $t1, 296($t0)
	sw $t1, 300($t0)
	sw $t1, 304($t0)
	sw $t1, 328($t0)
	sw $t1, 332($t0)
	sw $t1, 336($t0)
	sw $t1, 340($t0)
	sw $t1, 344($t0)
	sw $t1, 348($t0)
	sw $t1, 352($t0)
	sw $t1, 356($t0)
	sw $t1, 360($t0)
	sw $t1, 364($t0)
	sw $t1, 368($t0)
	sw $t1, 372($t0)
	sw $t1, 392($t0)
	sw $t1, 408($t0)
	sw $t1, 412($t0)
	sw $t1, 416($t0)
	sw $t1, 420($t0)
	sw $t1, 436($t0)
	sw $t1, 456($t0)			
	sw $t1, 472($t0)
	sw $t1, 476($t0)
	sw $t1, 480($t0)
	sw $t1, 484($t0)
	sw $t1, 500($t0)
	sw $t1, 520($t0)
	sw $t1, 524($t0)
	sw $t1, 536($t0)
	sw $t1, 548($t0)
	sw $t1, 560($t0)
	sw $t1, 564($t0)
	sw $t1, 588($t0)
	sw $t1, 592($t0)
	sw $t1, 596($t0)
	sw $t1, 600($t0)
	sw $t1, 612($t0)
	sw $t1, 616($t0)
	sw $t1, 620($t0)
	sw $t1, 624($t0)
	sw $t1, 656($t0)
	sw $t1, 660($t0)
	sw $t1, 664($t0)
	sw $t1, 676($t0)
	sw $t1, 680($t0)
	sw $t1, 684($t0)
	sw $t1, 724($t0)
	sw $t1, 728($t0)
	sw $t1, 732($t0)
	sw $t1, 736($t0)
	sw $t1, 740($t0)
	sw $t1, 796($t0)
	sw $t1, 800($t0)
	sw $t1, 860($t0)
	sw $t1, 864($t0)
				

	#Mostrar mensaje de Muerte por Consola	
	li $v0, 4
	la $a0, mensajeMuerte
	syscall
	
	#Guardar $ra y Reproducir sonido de muerte
	add $t0, $ra, $zero
	jal SonidoPerderJuego
	add $ra, $t0, $zero
	
	j JugarDeNuevo
