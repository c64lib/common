/*
 * MIT License
 *
 * Copyright (c) 2018-2023 c64lib
 * Copyright (c) 2018-2023 Maciej Małecki
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
