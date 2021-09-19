NMI:
  PHP
  PHA
  TXA
  PHA
  TYA
  PHA

  LDA nmiStatus
  CMP #WAITNMI
  BNE endNmi
  
  LDA #$00
  STA OAMADDR       ; set the low byte (00) of the RAM address
  LDA #$02
  STA OAMDMA       ; set the high byte (02) of the RAM address, start the transfer
  
  JSR processNmiBufferW
  JSR processNmiBufferL
  
  LDA igPPUCTRL
  STA PPUCTRL
  LDA #%00011110   ; enable sprites, enable background, no clipping on left side
  STA PPUMASK
  LDA cameraX       	; Load X camera position
  STA PPUSCROLL
  LDA cameraY			; Load Y camera position
  STA PPUSCROLL
  
  LDA #NMIDONE
  STA nmiStatus
  
endNmi:
  
  PLA
  TAY
  PLA
  TAX
  PLA
  PLP
  
IRQ:
  
  RTI