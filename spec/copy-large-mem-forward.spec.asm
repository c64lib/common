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
#import "64spec/lib/64spec.asm"
#import "../lib/invoke-global.asm"


sfspec: init_spec()

  describe("copyLargeMemForward")

  it("copies 7 bytes forward non overlapping"); {
    c64lib_pushParamW(dataToBeMoved)
    c64lib_pushParamW(targetLocation)
    c64lib_pushParamW(7)
    jsr copyLargeMemForward

    assert_bytes_equal 7: targetLocation: dataToBeMoved
  }

  it("copies 260 bytes forward non overlapping"); {
    c64lib_pushParamW(largeDataToBeMoved)
    c64lib_pushParamW(largeTargetLocation)
    c64lib_pushParamW(260)
    jsr copyLargeMemForward

    assert_bytes_equal 19: largeTargetLocation: largeDataToBeMoved
  }

finish_spec()

* = * "Data"
copyLargeMemForward:
                #import "../lib/sub/copy-large-mem-forward.asm"
dataToBeMoved: .text "foo bar"
targetLocation: .text "       "

largeDataToBeMoved: .fill 260, 127.5 + sin(toRadians(i*360/256))
largeTargetLocation: .fill 260, 0
