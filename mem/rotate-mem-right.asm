#import "../invoke.asm"


/*
 * Rotates content given memory area to the right.
 * IN:
 *   X - count
 *   Stack WORD - address
 * OUT:
 *   none
 * MOD: A, X
 */
rotateMemRight:
.namespace c64lib {
        {
          invokeStackBegin(returnPtr)
          pullParamWList(List().add(loadFirst + 1, loadNext + 1, staNext + 1, staLast + 1))
          
          loadFirst: lda $ffff, x
          sta preserve
        loop:
          dex
          loadNext: lda $ffff, x
          inx
          staNext: sta $ffff, x
          dex
          bne loop
          lda preserve
          staLast: sta $ffff
          
          invokeStackEnd(returnPtr)
          rts
          // local vars
          returnPtr: .word 0
          preserve: .byte 0
        }
}
