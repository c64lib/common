#import "../invoke.asm"
#import "../mem.asm"
#import "../math.asm"

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
  pullParamW(staNext)
  pullParamW(ldaNext)

  addMem16(copyCounter, staNext)
  addMem16(copyCounter, ldaNext)
  copyNextPage:
    sub16(256, ldaNext)
    sub16(256, staNext)
    ldx #$ff
    copyNext:
      lda ldaNext:$ffff, x
      sta staNext:$ffff, x
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
