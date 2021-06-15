#import "../invoke.asm"

/*
 * Rotates content of given memory area to the right.
 * IN:
 *   X - count
 *   Stack WORD - address
 * OUT:
 *   none
 * MOD:
 *   A, X
 */
.namespace c64lib {
  rotateMemRight: {

  invokeStackBegin(returnPtr)
  pullParamWList(List().add(loadFirst, loadNext, staNext, staLast))

  lda loadFirst:$ffff, x
  sta preserve
  loop:
    dex
    lda loadNext:$ffff, x
    inx
    sta staNext:$ffff, x
    dex
  bne loop
  lda preserve
  sta staLast:$ffff

  invokeStackEnd(returnPtr)
  rts
  // local vars
  returnPtr:      .word 0
  preserve:       .byte 0
  }
}
