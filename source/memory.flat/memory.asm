; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		memory.asm
;		Purpose:	BASIC program space manipulation
;		Created:	19th September 2022
;		Reviewed: 	No
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code

; ************************************************************************************************
;
;									Erase the current program
;
; ************************************************************************************************

MemoryNew:
		.resetCodePointer 					; point to start of program memory
		lda 	#0 							; write zero there erasing the program.
		.cset0	
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