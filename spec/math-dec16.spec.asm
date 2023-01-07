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
#import "../lib/math-global.asm"

sfspec: init_spec()
  describe("dec16")

  it("of 0 gives 65535"); {
    c64lib_dec16(dec16ZeroActual)
    assert_equal16 dec16ZeroActual: dec16ZeroExpected
  }

  it("of 5 gives 4"); {
    c64lib_dec16(dec16Actual)
    assert_equal16 dec16Actual: dec16Expected
  }

  it("of 256 gives 255"); {
    c64lib_dec16(dec16WordActual)
    assert_equal16 dec16WordActual: dec16WordActual
  }

finish_spec()

* = * "Data"
dec16Actual: .word 5
dec16Expected: .word 4
dec16WordActual: .word 256
dec16WordExpected: .word 255
dec16ZeroActual: .word 0
dec16ZeroExpected: .word $ffff