FT_BASE_ADR		= $0300	;page in the RAM used for FT2 variables, should be $xx00
FT_TEMP			= $00	;3 bytes in zeropage used by the library as a scratchpad
FT_DPCM_OFF		= $c000	;$c000..$ffc0, 64-byte steps
FT_SFX_STREAMS	= 4		;number of sound effects played at once, 1..4

FT_DPCM_ENABLE			;undefine to exclude all DMC code
FT_SFX_ENABLE			;undefine to exclude all sound effects code
FT_THREAD				;undefine if you are calling sound effects from the same thread as the sound update call

FT_PAL_SUPPORT			;undefine to exclude PAL support
FT_NTSC_SUPPORT			;undefine to exclude NTSC support