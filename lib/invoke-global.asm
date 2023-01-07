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

.macro @c64lib_invokeStackBegin(placeholderPtr) { invokeStackBegin(placeholderPtr) }
.macro @c64lib_invokeStackEnd(placeholderPtr) { invokeStackEnd(placeholderPtr) }
.macro @c64lib_pushParamB(value) { pushParamB(value) }
.macro @c64lib_pushParamW(value) { pushParamW(value) }
.macro @c64lib_pushParamBInd(ptr) { pushParamBInd(ptr) }
.macro @c64lib_pushParamWInd(ptr) { pushParamWInd(ptr) }
.macro @c64lib_pullParamB(placeholderPtr) { pullParamB(placeholderPtr) }
.macro @c64lib_pullParamW(placeholderPtr) { pullParamW(placeholderPtr) }
.macro @c64lib_pullParamWList(placeholderPtrList) { pullParamWList(placeholderPtrList) }
