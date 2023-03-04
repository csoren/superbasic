; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		option.asm
;		Purpose:	Set control memory
;		Created:	4th March 2023
;		Reviewed: 	No
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code

OptionCommand: ;; [option]
		ldx 	#0 							; bottom of stack
		jsr		Evaluate8BitInteger 		; address
		pha
		jsr 	CheckComma
		inx
		jsr		Evaluate8BitInteger 		; data
		;
		plx
		sta 	ControlStorage,x
		rts
		;		
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
