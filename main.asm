;ines header
  .include "global/ines_header.asm"
  
;Constants
  .include "global/nes_constants.asm"
  .include "global/game_constants.asm"
  .include "global/famitone_contants.asm"
  
;Variables
  .include "global/variables.asm"

;Program
  .include "prg_rom/prg_rom.asm"
  
;Data
  .include "prg_rom/data.asm"
  
;Vectors
  .include "global/vectors.asm"

;Graphics
  .include "chr_rom/chr_rom.asm"