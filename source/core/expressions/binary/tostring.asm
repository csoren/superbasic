; ***************************************************************************************
; ***************************************************************************************
;
;		Name : 		tostring.asm
;		Author :	Paul Robson (paul@robsons.org.uk)
;		Date : 		29th September 2022
;		Reviewed :
;		Purpose :	Convert Integer to String
;
; ***************************************************************************************
; ***************************************************************************************

; ***************************************************************************************
;
;							Convert XA to string return in XA
;
; ***************************************************************************************

ConvertInt16:
		sta 	NSMantissa0 				; set up as 32 bit conversion
		stx 	NSMantissa1
		stz 	NSMantissa2
		stz 	NSMantissa3		
		stz 	NSStatus 					; positive integer
		ldx 	#0 							; stack level
		lda 	#10 						; base
		bra 	ConvertInt32

; ***************************************************************************************
;
;						Convert string at Level X Base A
;
; ***************************************************************************************

ConvertInt32:
		phy
		ldy  	#0 							; index into buffer.
		bit 	NSStatus 					; output a - if not negative.
		bpl 	_CI32NotNeg
		pha
		lda 	#'-'
		sta 	NumberBuffer,y
		iny
		pla
_CI32NotNeg:
		jsr 	_CI32DivideConvert 			; recursive conversion
		lda 	#0 							; make ASCIIZ
		sta 	NumberBuffer,y
		ply
		ldx 	#NumberBuffer >> 8
		lda 	#NumberBuffer & $FF
		rts

_CI32DivideConvert:
		inx 								; write to next slot up
		jsr 	NSMSetByte 		
		dex
		jsr 	Int32Divide 				; divide
		;
		lda 	NSMantissa0,x 				; save remainder
		pha 

		jsr 	NSMCopyPlusTwoToZero 		; Copy the divide result into place.
		;
		jsr 	NSMIsZero 					; is it zero ?
		beq 	_CI32NoRecurse 				; if so, don't recursively call.
		;
		lda 	NSMantissa0+1,x 			; this is the base which is not changed by divide
		jsr 	_CI32DivideConvert 			; and recusrively call.
_CI32NoRecurse:
		pla 								; remainder
		cmp 	#10 						; convert to ASCII
		bcc 	_CI32NotHex
		adc 	#6+32
_CI32NotHex:
		adc 	#48		
		sta 	NumberBuffer,y 				; write out and exit		
		iny
		rts


; ***************************************************************************************
;
;									Changes and Updates
;
; ***************************************************************************************
;
;		Date			Notes
;		==== 			=====
;
; ***************************************************************************************