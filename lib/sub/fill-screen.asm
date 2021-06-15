#import "../invoke.asm"
#import "../math.asm"

/*
 * Fills given 1024 bytes of memory with given byte.
 * IN:
 *   A - value
 *   Stack WORD - address
 * OUT:
 *   none
 * MOD: A, X
 */
.namespace c64lib {
  fillScreen: {

  sta value + 1
  invokeStackBegin(returnPtr)
  pullParamWList(List().add(sta0 + 1, sta1 + 1, sta2 + 1, sta3 + 1))
  add16($0100, sta1 + 1)
  add16($0200, sta2 + 1)
  add16($0300, sta3 + 1)

  value:      lda #$00
              ldx #$00
              loop:
  sta0:         sta $ffff, x
  sta1:         sta $ffff, x
  sta2:         sta $ffff, x
  sta3:         sta $ffff, x
                inx
              bne loop

  invokeStackEnd(returnPtr)
  rts
  // local vars
  returnPtr: .word 0
  }
}
