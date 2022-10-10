; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		sprite.asm
;		Purpose:	Sprite Source Handler
;		Created:	9th October 2022
;		Reviewed: 	No
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code

; ************************************************************************************************
;
;								Access from Sprite Memory
;
; ************************************************************************************************

GXSpriteHandler:
		lda 	gzTemp0+1 					; eor with mode
		eor 	gxMode
		sta 	gxUseMode

		lda 	#GXSpritePage
		sta 	GXSpriteBasePage

		ldx 	gzTemp0 					; sprite #
		phx
		jsr 	GXOpenBitmap 				; can access sprite information
		pla
		jsr 	GXFindSprite 				; get the sprite address
		jsr 	GXCloseBitmap

		lda 	#8
		ldx 	#GXSpriteAcquire & $FF
		ldy 	#GXSpriteAcquire >> 8
		jsr 	GXDrawGraphicElement
		rts

GXSpriteAcquire:
		lda 	GXspriteBasePage		
		sta 	GFXEditSlot
		ldy 	#0
		txa
		asl 	a
		asl 	a
		asl 	a
		tax
_GXSALoop:
		lda 	GXMappingAddress+$200,x
		inx
		sta 	gxPixelBuffer,y
		iny
		cpy 	#8
		bne 	_GXSALoop
		rts

		.send code

		.section storage
GXSpriteBasePage:
		.fill 	1
		.send storage		
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