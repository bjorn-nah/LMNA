playScene1:
	LDA substate
	CMP #INITIALIZE
	BEQ loadInit
	JMP NoSquareRender
loadInit:
	
	JSR disableNmi
	
	LDA #$20
	STA arg1
	LDA #$00
	STA arg2
	JSR loadSquares
	
	LDA #$28
	STA arg1
	LDA #$40
	STA arg2
	JSR loadSquares
	
	LDA #$28
	STA arg1
	LDA #$00
	STA arg2
	JSR rustineSquares
	
	LDA #$2A
	STA arg1
	LDA #$C0
	STA arg2
	JSR deleteTxtAera
	
	JSR setAttibTable
	
	LDA #NORM
	STA substate
	
	LDA #$00
	;STA charPos
	STA charSide
	STA speed
	STA direction
	
	ldx #LOW(jesaispas_music_data)	;initialize using the first song data, as it contains the DPCM sound effect
	ldy #HIGH(jesaispas_music_data)
	lda #$00	;PAL mode
	jsr FamiToneInit		;init FamiTone
	
	JSR enableNmi
	
	  lda #0
  jsr FamiToneMusicPlay
	
	JSR LoadPlayerSprite
	LDA #$9C
	;LDA #$8C
	STA PosX
	LDA #$CA
	STA PosY
	JSR setPosPlrSpr
	
	LDA #HIGH(text)
	STA charPosHi
	LDA #LOW(text)
	STA charPosLo
	
	JMP GameEngineDone

NoSquareRender:
	
	LDA time
	AND #$01
	CMP #$00
	BNE dontIncScroll
	INC scroll
dontIncScroll:

	LDA time
	AND #$1F
	CMP #$00
	BNE dontchangespeed
	LDA direction
	AND #%00000010
	CMP	#$00
	BNE increaseSpeed
	LDA speed
	SEC
	ROL A
	STA speed
	CMP #$1F
	BNE dontchangespeed
	;LDA #$00
	;STA speed
	LDA direction
	EOR #%00000011	;hack tellement fou pour passer de $00 à $01 et inversement
	STA direction
	JMP dontchangespeed
increaseSpeed:
	LDA speed
	CLC
	ROR A
	STA speed
	CMP #$00
	BNE dontchangespeed
	LDA direction
	EOR #%00000010	;hack tellement fou pour passer de $00 à $01 et inversement
	STA direction

dontchangespeed:

	LDA time
	AND speed
	CMP #$00
	BNE dontTurn
	LDA direction
	AND #%00000001
	CMP #$00
	BNE turnBackward
	LDA rotation
	CLC
	ADC #$20
	STA rotation
	JMP dontTurn
turnBackward:
	LDA rotation
	SEC
	SBC #$20
	STA rotation
dontTurn:


	LDA time
	AND #$07
	CMP #$00
	BNE dontWrite
	;LDX charPos	
	;LDA (text),x
	LDY #$00
	LDA [charPosLo], y
	STA temp
	CMP #$5E			;si on trouve le char ^ on loop le scroll
	BNE continueWrite
	LDA #HIGH(text)
	STA charPosHi
	LDA #LOW(text)
	STA charPosLo
	JMP dontWrite
	
continueWrite:	
	LDA temp
	STA arg1
	LDA charSide
	STA arg2
	
	LDA #$2B
	STA pointerPPUHi
	LDA time
	CLC
	ROR A
	CLC
	ROR A
	;CLC
	;ROR A
	CLC
	ROR A				; /8
	CLC
	ADC #$20
	STA temp
	STA pointerPPULo
	JSR printBigTxt
	
	LDA charSide		
	CMP #$00				;si charSide = 0
	BEQ changeCharSide		;si charSide != 0
	;INC charPos				; INC charPos
	LDA charPosLo
	CLC
	ADC #$01
	STA charPosLo
	LDA charPosHi
	ADC #$00
	STA charPosHi
	LDA #$00
	STA charSide			; raz charSide
	JMP dontWrite
	
	LDA charPosHi
	
changeCharSide:
	INC charSide			;si charSide = 0 -> INC charSide

dontWrite:

	LDA time
	AND #$0F
	TAX
	LDA (bump),x
	STA temp
	LDA #$CA
	SEC
	SBC temp
	STA PosY
	JSR setPosPlrSpr
	
	LDA scroll
	TAX
	LDA (sinTable), x
	CLC
	ADC rotation
	STA cameraX
	
	LDA scroll
	CLC
	ROL A
	ADC #$80
	TAX
	LDA (sinTable), x
	CLC
	ROR A
	STA cameraY

	JSR waitForSprit0
	
	jsr FamiToneUpdate  
	
	JMP GameEngineDone
	
;---fonctions---	
	
loadSquares:
	LDA #HIGH(square1)
	STA pointerHi
	LDA #LOW(square1)
	STA pointerLo
	
	LDA arg1
	STA pointerPPUHi
	LDA arg2
	STA pointerPPULo
	STA temp
	
newSquare:
	LDY #$00
	LDX #$00
	
setSquare:
	LDA pointerPPUHi
	AND #%11110111			;pour touts les multiples de 23x4
	CMP #%00100011
	;CMP #$23
	BNE continueSquare1
	CLC
	LDA pointerPPULo
	CMP #$BF
	BCC continueSquare1	
	JMP nextSquare

continueSquare1:
	LDA PPUSTATUS         ; read PPU status to reset the high/low latch
	LDA pointerPPUHi
	STA PPUADDR             ; write the high byte of $2000 address
	LDA pointerPPULo
	STA PPUADDR             ; write the low byte of $2000 address

setSquareTule:	
	LDA  [pointerLo], y
	STA PPUDATA             ; write to PPU
	INY
	TYA
	AND #$03
	CMP #$00
	BNE setSquareTule
nextSquare:
	INX
	LDA pointerPPULo
	CLC
	ADC #$20
	STA pointerPPULo
	BCC dontInc1
	INC pointerPPUHi
dontInc1:
	CPX #$04
	BNE setSquare
	LDA pointerPPULo
	AND #$1F
	CMP #$1C
	BEQ newLine
	
	LDA pointerPPULo
	CLC
	ADC #$04
	STA pointerPPULo
	JMP endLine
	
newLine:
	LDA pointerPPULo
	SEC
	SBC #$1C
	STA pointerPPULo
endLine:	
	;BCC dontInc2
	;INC pointerPPUHi
;dontInc2:
	LDA pointerPPUHi
	AND #%11110111			;pour touts les multiples de 24x4
	CMP #%00100100
	;CMP #$24
	BNE newSquare
	
	LDA #LOW(square8)
	CMP pointerLo
	BNE continueSquare
	LDA #HIGH(square8)
	CMP pointerHi
	BNE continueSquare
	JMP endSquare
continueSquare:
	LDA pointerLo
	CLC
	ADC #$10
	STA pointerLo
	BCC dontInc3
	INC pointerHi
dontInc3:
	LDA temp
	CLC
	ADC #$04
	STA temp
	STA pointerPPULo
	LDA arg1
	STA pointerPPUHi
dontInc4:
	JMP newSquare

endSquare:
	RTS
	
rustineSquares:
	LDX #$00
	LDA PPUSTATUS         ; read PPU status to reset the high/low latch
	LDA arg1
	STA PPUADDR             ; write the high byte of $2000 address
	LDA arg2
	STA PPUADDR             ; write the low byte of $2000 address

rustineLoop:
	LDA (rustine),x
	STA PPUDATA
	INX
	CPX #$40
	BNE rustineLoop
	
	RTS
	
deleteTxtAera:
	LDX #$00
	LDA PPUSTATUS         ; read PPU status to reset the high/low latch
	LDA arg1
	STA PPUADDR             ; write the high byte of $2000 address
	LDA arg2
	STA PPUADDR             ; write the low byte of $2000 address
	
delteLoop:
	LDA #$00
	STA PPUDATA
	INX
	CPX #$00
	BNE delteLoop
	
	RTS
	
setAttibTable:
	LDX #$00
	LDA PPUSTATUS
	LDA #$2B
	STA PPUADDR
	LDA #$E8
	STA PPUADDR
	
setAttibLoop:
	LDA #$AA
	STA PPUDATA
	INX
	CPX #$10
	BNE setAttibLoop
	RTS
	
waitForSprit0:
WaitNotSprite0:
  bit PPUSTATUS
  bvs WaitNotSprite0
WaitSprite0:
  bit PPUSTATUS
  bvc WaitSprite0

Sprite0Wait:
	LDA #$08
	STA PPUADDR
	LDA #$E0 			; Load Y camera position
	STA PPUSCROLL
	LDA time			; Load X camera position
	STA PPUSCROLL
	AND #%11111000
	LSR A
	LSR A
	LSR A
	STA PPUADDR
	RTS
	