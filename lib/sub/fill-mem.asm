#import "../invoke.asm"

/*
 * Fills memory at given address with given value.
 * IN:
 *   A - value
 *   X - count
 *   Stack WORD - address
 * OUT:
 *   none
 * MOD: A, X
 */
.namespace c64lib {
  fillMem: {

  sta value + 1 // preserve A for later usage
  invokeStackBegin(returnPtr)
  pullParamW(address + 1)

  value:      lda #$00
              loop:
                dex
  address:      sta $ffff, x
              bne loop

  invokeStackEnd(returnPtr)
  rts
  // local vars
  returnPtr: .word 0
  }
}
