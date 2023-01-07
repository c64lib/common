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
#importonce
.filenamespace c64lib

/*
 * Performs RLE (Running Length Encoding) compression of given binary data (kick assembler data type).
 * The compressed result is placed as is in the result file starting from the place where this macro is called.
 */
.macro compressRLE(binaryData) {
    .var runLength = 0
    .var runValue = 0
    .var crunchedLength = 0
    .for(var i = 0; i < binaryData.getSize(); i++) {
        .if(runLength > 0 && (binaryData.get(i) != runValue || runLength == $ff)) {
            .byte runLength
            .byte runValue
            .eval runLength = 0
            .eval crunchedLength = crunchedLength + 2
        }
        .if(runLength == 0) {
            .eval runValue = binaryData.get(i)
            .eval runLength = 1
        } else {
            .eval runLength++
        }
    }
    .byte runLength
    .byte runValue
    .byte $00 // end mark
    .eval crunchedLength++
    .print "Crunched from " + binaryData.getSize() + " to " + crunchedLength + " (" + round((crunchedLength/binaryData.getSize())*100) + "%)"
}
