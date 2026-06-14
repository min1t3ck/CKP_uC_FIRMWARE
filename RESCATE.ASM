        ; Definición de registros
    CBLOCK 0x40        ; Dirección de inicio para registros o variables
        W_R, ST_R, PC_R
    ENDC

    MOVWF W_R;		    Mover el contenido de WREG a una dirección de memoria
    SWAPF STATUS, W ;	SWAPF PARA NO AFECTAR AL REGISTRO AL MOMENTO DE GUARDARLO YA QUE MOVF PUEDE HACERLO
    MOVWF ST_R   ;	    Mover WREG a la dirección de memoria
    CLRF STATUS ;	    Limpiar el registro
    MOVF PCLATH, W;	    Mover el contenido de PCLATH a WREG      
    MOVWF PC_R;		    Dirección de retorno (POR SI LA INTERRUPCÓN OCURRIO EN UN DIRECCIONAMINETO INDIRECTO)
 
    ;RESPALDO DEL VALOR DE LOS REGISTROS PARA SUBRUTINAS DE TIEMPO
    
;************RESPALDO REGISTRO PARA SUBT1V***************************
    MOVF 0x50, W;	    Dirección 0x60
    MOVWF 0x45;		    Dirección de memoria 0x45
    
;***********RESPALDO REGISTROS PARA SUBT2V***************************
    MOVF 0x51, W;	    Dirección 0x51
    MOVWF 0X46 
    MOVF 0x52, W;	    Dirección 0x52
    MOVWF 0X47;
    MOVF 0x53, W;	    Dirección 0x53
    MOVWF 0X48  
    
;***********RESPALDOS REGISTRO PARA SUBT3V***************************        
    MOVF 0x54, W;	    Dirección 0x64
    MOVWF 0X49; 
    MOVF 0x55, W;	    Dirección 0x65
    MOVWF 0X4A
    MOVF 0x56, W;	    Dirección 0x66
    MOVWF 0X4B
    MOVF 0x57, W;	    Dirección 0x67
    MOVWF 0X4C
    MOVF 0x58, W;	    Dirección 0x68        
    MOVWF 0x4D;      
