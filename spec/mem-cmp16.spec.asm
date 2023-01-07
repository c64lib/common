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
#import "../lib/mem-global.asm"

sfspec: init_spec()

  describe("cmp16")

  it("of 256 and 256 gives true"); {
    c64lib_cmp16(256, _256)
    assert_z_set
  }

  it("of 0 and 256 gives false"); {
    c64lib_cmp16(0, _256)
    assert_z_cleared
  }

  it("of 7 and 7 gives true"); {
    c64lib_cmp16(7, _7)
    assert_z_set
  }

  it("of 0 and 0 gives true"); {
    c64lib_cmp16(0, _0)
    assert_z_set
  }

finish_spec()

* = * "Data"
_256: .word 256
_7: .word 7
_0: .word 0
