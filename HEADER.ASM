; FILE: HEADER.ASM
; AUTOR: ARREGUIN HERNANDEZ JULIO DAVID
; DATE: 10/06/2026
; BRIEF: ENCABEZADO CONTROL DE INYECCION ELECTRONICA CONTROL CKP
; VERSION: 0.1
; Copyright (c) 2026
; LICENCE: MIT


		PROCESSOR       P12F675
        #INCLUDE        <P12F675.INC>
		__CONFIG		0X01E4; 			SE EXPLICA EN EL ARCHIVO "README"
        
        ORG             0X0000
        GOTO            INICIO

;//////////////INTERRUPCION////////////////
        ORG             0X0004
        INCLUDE         <./RESCATE.ASM>
        GOTO            RSI; (RUTINA DE SERVICIO DE INTERRUPCION)
;//////////////////////////////////////////


INICIO:
        CLRF            GPIO
		MOVLW			B'00000111'
		MOVWF			CMCON				;COMPARATOR OFF
        BSF             STATUS,RP0			;B1
        CLRF            ANSEL               ;<- ANLOGIC OUT OFF