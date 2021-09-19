;global game states:
STATETITLE     = $00  ; displaying title screen
STATEMENU	   = $01  ; displaying menu
STATEPLAYING   = $02  ; move meccha/bullets, check for collisions, display score
STATEGAMEOVER  = $03  ; displaying score and game over screen
STATEPAUSE     = $99

;phases states (substates):
INITIALIZE	= $00
DRAW		= $01
NORM		= $02  ; normal state
PAUSE		= $03
CLEAR		= $04  ; clear screen state
CLEARED		= $05  ; screen cleared

PLAYER_1	= $00
PLAYER_2	= $01

;Menu's players states:
WAIT		= $00
CHANGE_UP	= $01
CHANGE_DOWN	= $02
SELECT		= $03

;Game's players states:
;WAIT		= $00
RUN			= $01
INIT_JUMP	= $02
JUMP		= $03
RECEPTION 	= $04
INIT_SLIDE	= $05
SLIDE		= $06
RAISE		= $07
HIT			= $08
;SELECT		= $10

RUNSPEED	= $0A
INITJUMPSPEED	= $05
RECEPTIONTIME	= $20
GRAVITY_DEC	= $10
MAXJUMP		= $20


ADRSHSPR1	= $0210

SPRITESIZE	= $04

PPUBUFFERW	= $0400
PPUBUFFERL	= $0500

; NMI stuff
NMIDONE		= $00
WAITNMI		= $01
DISABLENMI	= $02

CLEARTULE = $00  ; tule used to clear screen  7