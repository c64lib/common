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
#import "math.asm"
#importonce
.filenamespace c64lib

.macro @c64lib_add16(value, low) { add16(value, low) }
.pseudocommand @c64lib_add16 value : low { add16 value : low }
.macro @c64lib_sub16(value, low) { sub16(value, low) }
.macro @c64lib_addMem16(source, destination) { addMem16(source, destination ) }
.macro @c64lib_asl16(low) { asl16(low) }
.macro @c64lib_inc16(destination) { inc16(destination) }
.macro @c64lib_dec16(destination) { dec16(destination) }
.macro @c64lib_mulAndAdd(left, right, targetAddr) { mulAndAdd(left, right, targetAddr) }
