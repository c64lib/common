#import "../invoke.asm"
#import "../mem.asm"

/*
 * Copies block of memory forward. Both source and target memory block can overlap as long as target
 * block is located higher than source block.
 *
 * IN:
 *   Stack WORD - source address
 *   Stack WORD - target address
 *   Stack WORD - size
 * MOD: A, X
 */
.namespace c64lib {
  copyLargeMemForward: {

  invokeStackBegin(returnPtr)
  pullParamW(copyCounter)
  pullParamW(staNext + 1)
  pullParamW(ldaNext + 1)
  
              addMem16(copyCounter, staNext + 1)
              addMem16(copyCounter, ldaNext + 1)
              copyNextPage:
                sub16(256, ldaNext + 1)
                sub16(256, staNext + 1)
                ldx #$ff
                copyNext:
  ldaNext:        lda $ffff, x
  staNext:        sta $ffff, x
                  dec16(copyCounter)
                  cmp16(0, copyCounter)
                  beq end
                  dex
                  cpx #$ff
                bne copyNext
              jmp copyNextPage
              end:
              
  invokeStackEnd(returnPtr)
  rts
  // local vars
  returnPtr: .word 0
  copyCounter: .word 0
  }
}
