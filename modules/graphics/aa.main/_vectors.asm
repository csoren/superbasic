;
;	This file is automatically generated
;

GRFirstFreeCode = 42

	.section code
GRVectorTable:
	.word	GXInitialise             ; $00 Initialise
	.word	GXControlBitmap          ; $01 BitmapCtl
	.word	GXControlSprite          ; $02 SpriteCtl
	.word	GXClearBitmap            ; $03 Clear
	.word	GXSetColourMode          ; $04 Colour
	.word	GXFontHandler            ; $05 DrawFont
	.word	GXSpriteHandler          ; $06 DrawSprite
	.word	GXSelect                 ; $07 SpriteUse
	.word	GXSelectImage            ; $08 SpriteImage
	.word	GXCollide                ; $09 SpriteCollide
	.word	GXControlTilemap         ; $0a TileCtl
	.word	GXControlTileSize        ; $0b TILESZ
	.word	GXControlTileScrollX     ; $0c TILESCLX
	.word	GXControlTileScrollY     ; $0d TILESCLY
	.word	GRUndefined              ; $0e
	.word	GRUndefined              ; $0f
	.word	GRUndefined              ; $10
	.word	GRUndefined              ; $11
	.word	GRUndefined              ; $12
	.word	GRUndefined              ; $13
	.word	GRUndefined              ; $14
	.word	GRUndefined              ; $15
	.word	GRUndefined              ; $16
	.word	GRUndefined              ; $17
	.word	GRUndefined              ; $18
	.word	GRUndefined              ; $19
	.word	GRUndefined              ; $1a
	.word	GRUndefined              ; $1b
	.word	GRUndefined              ; $1c
	.word	GRUndefined              ; $1d
	.word	GRUndefined              ; $1e
	.word	GRUndefined              ; $1f
	.word	GXMove                   ; $20 Move
	.word	GXLine                   ; $21 Line
	.word	GXFrameRectangle         ; $22 FrameRect
	.word	GXFillRectangle          ; $23 FillRect
	.word	GXFrameCircle            ; $24 FrameCircle
	.word	GXFillCircle             ; $25 FillCircle
	.word	GRUndefined              ; $26
	.word	GRUndefined              ; $27
	.word	GXPlotPoint              ; $28 Plot
	.word	GXMoveSprite             ; $29 SpriteMove
	.send code
