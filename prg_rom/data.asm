  .bank 1
  .org $E000
  
palette:
	.db $0f,$0c,$1c,$32,$0f,$2a,$2b,$2c,$0f,$05,$15,$36,$0f,$15,$05,$27
	.db $0f,$00,$10,$30,$0f,$01,$21,$31,$0f,$06,$16,$26,$0f,$09,$19,$29
text:
  .db "LOOK MUM, NO ASIC! HELLO DEMOSCENE, BJORN AT KEYBOARD. AFTER MANY YEARS OF PROCRASTINATION, I FINALLY SUBMIT A DEMOSCENE RELATED STUFF! I ASSUME THAT'S NOT REALLY IMPRESSIVE, BUT I'M HAPPY TO PRESENT SOMETHING ON A OLDSCHOOL HARDWARE. MY INITIAL PLAN WAS TO WORK ON A LESS COMMON CONSOLE BUT IT'S BEEN FOR A NEXT TIME. THIS INTRO WAS CODED IN ASM, USING FAMITONE2 (TO PLAY THIS CRAPPY MUSIC) AND NESST BY SHIRU, THE CUBE WAS PRE RENDERED ON OPENSCAD AND GRAFX2 WAS USED FOR PIXEL STUFF. THIS EFFECT DOESN'T USE ADDITIONAL NES HARDWARE AND ONLY TAKE ADVANTAGE OF STOCK PPU FUNCTIONS. A HUGE THANKS TO NESDEV FRIENDS BROKE STUDIO, ROGER BIDON & GODZIL FOR HELP AND SUPPORT!	GREETZ TO EVERYONE AT THE PARTY! I ALSO HAVE TO THANK SHADOW PARTY TEAM FOR ORGANIZATION!                  TIME TO SCROLL RESTART!                               ^"

bump:
	.db $00,$01,$02,$03,$04,$04,$05,$05,$05,$05,$05,$04,$04,$03,$02,$01
	
	
sprite0:
	;	vert tile attr horiz
	.db $00,$01,$01,$00   ;sprite 0
	
square1:
	.db $01,$02,$03,$04
	.db $20,$21,$22,$23
	.db $40,$41,$42,$43
	.db $58,$59,$5a,$58

square2:
	.db $05,$06,$07,$08
	.db $24,$25,$26,$27
	.db $44,$41,$45,$46
	.db $5b,$5c,$5d,$58

square3:
	.db $09,$0a,$0b,$0c
	.db $28,$29,$2a,$2b
	.db $47,$42,$48,$49
	.db $5e,$5f,$60,$58

square4
	.db $0d,$0e,$0f,$10
	.db $2c,$2d,$2e,$2f
	.db $4a,$42,$42,$4b
	.db $61,$62,$63,$58

square5:
	.db $11,$12,$12,$13
	.db $30,$31,$32,$33
	.db $4c,$42,$42,$4d
	.db $64,$62,$62,$65

square6:
	.db $14,$15,$16,$17
	.db $34,$35,$36,$37
	.db $4e,$4f,$50,$51
	.db $58,$66,$67,$68

square7:
	.db $18,$19,$1a,$1b
	.db $38,$39,$3a,$3b
	.db $52,$53,$50,$54
	.db $58,$69,$67,$58

square8:
	.db $1c,$1d,$1e,$1f
	.db $3c,$3d,$3e,$3f
	.db $55,$56,$42,$57
	.db $58,$6a,$6b,$6c
	
ascii:
;ligne 1
	.db $00,	$00
	.db $00,	$00

	.db $6d,	$6e
	.db $7a,	$7b

	.db $6f,	$6f
	.db $00,	$00

	.db $70,	$71
	.db $7c,	$7d

	.db $72,	$73
	.db $7e,	$7f

	.db $74,	$75
	.db $80,	$81

	.db $76,	$77
	.db $82,	$83

	.db $6f,	$00
	.db $00,	$00

	.db $00,	$78
	.db $00,	$84

	.db $79,	$00
	.db $85,	$00

	.db $00,	$00
	.db $00,	$00

	.db $00,	$00
	.db $00,	$00

	.db $00,	$00
	.db $86,	$00

	.db $00,	$00
	.db $00,	$00

	.db $00,	$00
	.db $87,	$88

	.db $00,	$00
	.db $00,	$00

;ligne 2
	.db $89,	$8a
	.db $9a,	$9b

	.db $8b,	$8a
	.db $9c,	$9d

	.db $8c,	$8d
	.db $9e,	$9f

	.db $8c,	$8d
	.db $a0,	$a1

	.db $8e,	$8a
	.db $a2,	$9d

	.db $8f,	$90
	.db $a0,	$a3

	.db $91,	$90
	.db $a4,	$a3

	.db $92,	$93
	.db $a5,	$a6

	.db $94,	$95
	.db $a4,	$a3

	.db $96,	$97
	.db $a7,	$a3

	.db $00,	$00
	.db $00,	$00

	.db $00,	$00
	.db $00,	$00

	.db $00,	$00
	.db $00,	$00

	.db $00,	$00
	.db $00,	$00

	.db $00,	$00
	.db $00,	$00

	.db $98,	$99
	.db $a8,	$a9

;ligne 3
	.db $00,	$00
	.db $00,	$00

	.db $8e,	$8a
	.db $bc,	$9d

	.db $aa,	$ab
	.db $bd,	$be

	.db $ac,	$8a
	.db $9a,	$bf

	.db $ad,	$ae
	.db $c0,	$9d

	.db $8f,	$af
	.db $9a,	$bf

	.db $8f,	$af
	.db $9a,	$c1

	.db $ac,	$b0
	.db $9a,	$c2

	.db $b1,	$b0
	.db $c3,	$9d

	.db $b2,	$b3
	.db $9a,	$9d

	.db $b4,	$8a
	.db $c4,	$c5

	.db $b5,	$b6
	.db $c3,	$c6

	.db $8f,	$b7
	.db $9a,	$bf

	.db $b8,	$b9
	.db $c3,	$9d

	.db $ba,	$bb
	.db $c7,	$c8

	.db $8e,	$8a
	.db $c0,	$9d

; ligne 4
	.db $8f,	$c9
	.db $9a,	$d2

	.db $8e,	$8a
	.db $c0,	$d3

	.db $8f,	$c9
	.db $9a,	$d4

	.db $ca,	$90
	.db $c4,	$c5

	.db $cb,	$cc
	.db $9c,	$d5

	.db $cd,	$8a
	.db $d6,	$be

	.db $cd,	$b0
	.db $d6,	$d7

	.db $cd,	$8a
	.db $d8,	$d9

	.db $ce,	$cf
	.db $da,	$db

	.db $ce,	$cf
	.db $9c,	$d5

	.db $d0,	$d1
	.db $9e,	$9f

	.db $00,	$00
	.db $00,	$00

	.db $00,	$00
	.db $00,	$00

	.db $00,	$00
	.db $00,	$00

	.db $00,	$00
	.db $00,	$00

	.db $00,	$00
	.db $00,	$00

rustine:
	.db $44,$41,$45,$46,$47,$42,$48,$49,$4a,$42,$42,$4b,$4c,$42,$42,$4d,$4e,$4f,$50,$51,$52,$53,$50,$54,$55,$56,$42,$57,$40,$41,$42,$43
	.db $5b,$5c,$5d,$58,$5e,$5f,$60,$58,$61,$62,$63,$58,$64,$62,$62,$65,$58,$66,$67,$68,$58,$69,$67,$58,$58,$6a,$6b,$6c,$58,$59,$5a,$58

sinTable:
	.db $80, $83, $86, $89, $8C, $90, $93, $96, $99, $9C, $9F, $A2, $A5, $A8, $AB, $AE
	.db $B1, $B3, $B6, $B9, $BC, $BF, $C1, $C4, $C7, $C9, $CC, $CE, $D1, $D3, $D5, $D8
	.db $DA, $DC, $DE, $E0, $E2, $E4, $E6, $E8, $EA, $EB, $ED, $EF, $F0, $F1, $F3, $F4
	.db $F5, $F6, $F8, $F9, $FA, $FA, $FB, $FC, $FD, $FD, $FE, $FE, $FE, $FF, $FF, $FF
	.db $FF, $FF, $FF, $FF, $FE, $FE, $FE, $FD, $FD, $FC, $FB, $FA, $FA, $F9, $F8, $F6
	.db $F5, $F4, $F3, $F1, $F0, $EF, $ED, $EB, $EA, $E8, $E6, $E4, $E2, $E0, $DE, $DC
	.db $DA, $D8, $D5, $D3, $D1, $CE, $CC, $C9, $C7, $C4, $C1, $BF, $BC, $B9, $B6, $B3
	.db $B1, $AE, $AB, $A8, $A5, $A2, $9F, $9C, $99, $96, $93, $90, $8C, $89, $86, $83
	.db $80, $7D, $7A, $77, $74, $70, $6D, $6A, $67, $64, $61, $5E, $5B, $58, $55, $52
	.db $4F, $4D, $4A, $47, $44, $41, $3F, $3C, $39, $37, $34, $32, $2F, $2D, $2B, $28
	.db $26, $24, $22, $20, $1E, $1C, $1A, $18, $16, $15, $13, $11, $10, $0F, $0D, $0C
	.db $0B, $0A, $08, $07, $06, $06, $05, $04, $03, $03, $02, $02, $02, $01, $01, $01
	.db $01, $01, $01, $01, $02, $02, $02, $03, $03, $04, $05, $06, $06, $07, $08, $0A
	.db $0B, $0C, $0D, $0F, $10, $11, $13, $15, $16, $18, $1A, $1C, $1E, $20, $22, $24
	.db $26, $28, $2B, $2D, $2F, $32, $34, $37, $39, $3C, $3F, $41, $44, $47, $4A, $4D
	.db $4F, $52, $55, $58, $5B, $5E, $61, $64, $67, $6A, $6D, $70, $74, $77, $7A, $7D
  .include "prg_rom/sound/jesaispas.asm"