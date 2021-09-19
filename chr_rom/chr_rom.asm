  .bank 2
  .org $0000
  .incbin "chr_rom/sprite.chr"  		;includes 4KB graphics file in bank A
  .incbin "chr_rom/background.chr"   	;includes 4KB graphics file in bank B
