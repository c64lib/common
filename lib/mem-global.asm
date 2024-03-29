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
#import "mem.asm"
#importonce
.filenamespace c64lib

.macro @c64lib_copyFast(source, destination, count) { copyFast(source, destination, count) }
.macro @c64lib_fillScreen(address, value) { fillScreen(address, value) }
.macro @c64lib_set8(value, mem) { set8(value, mem) }
.pseudocommand @c64lib_set8 value : mem { set8 value : mem }
.pseudocommand @c64lib_copy8 source: dest { copy8 source: dest }
.pseudocommand @c64lib_copy16 source: dest { copy16 source: dest }
.macro @c64lib_set16(value, mem) { set16(value, mem) }
.macro @c64lib_copyWordIndirect(source, destinationPointer) { copyWordIndirect(source, destinationPointer) }
.macro @c64lib_cmp16(value, low) { cmp16(value, low) } 
.macro @c64lib_rotateMemRightFast(startPtr, count) { rotateMemRightFast(startPtr, count) }
