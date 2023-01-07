/*
 * MIT License
 *
 * Copyright (c) 2017-2023 c64lib
 * Copyright (c) 2017-2023 Maciej Małecki
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
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
