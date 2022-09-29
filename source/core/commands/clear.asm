; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		clear.asm
;		Purpose:	CLEAR command
;		Created:	18th September 2022
;		Reviewed: 	No
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code

ClearCommand: ;; [clear]
		;
		;		Scan through all the variables resetting them to zero.
		;
		.set16 	zTemp0,VariableSpace
_ClearZeroLoop:		
		lda 	(zTemp0) 					; end of variables
		beq 	_ClearZeroEnd

		ldy 	#3 							; erase the variables
		lda 	#0
_ClearOneVariable:	
		sta 	(zTemp0),y
		iny
		cpy 	#8
		bne 	_ClearOneVariable	

		clc 								; go to the next variable
		lda 	(zTemp0)
		adc 	zTemp0
		sta 	zTemp0
		bcc 	_ClearZeroLoop
		inc 	zTemp0+1
		bra 	_ClearZeroLoop

_ClearZeroEnd:
		;
		;		Reset the low memory allocation pointer
		;
		clc
		lda 	zTemp0
		adc 	#1
		sta 	lowMemPtr
		lda 	zTemp0+1
		adc 	#0
		sta 	lowMemPtr+1
		;
		;		Reset the BASIC Stack pointer
		;
		; **TODO**
		;
		;		Reset the BASIC string pointer
		;
		jsr 	StringSystemInitialise		
		;
		;		Scan the program code for Procedures (possibly convert intarrys back above ?)
		;
		; **TODO**		
		rts

		.send code

; ************************************************************************************************
;
;									Changes and Updates
;
; ************************************************************************************************
;
;		Date			Notes
;		==== 			=====
;
; ************************************************************************************************