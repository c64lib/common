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
/*
 * Set of KickAssembler macros for subroutine implementation.
 *
 * With these macros one can realize communication with subroutines using stack. This approach
 * is following:
 * 1) subroutine caller prepares input parameters and pushes them to the stack using push*() macros
 * 2) subroutine is then called using JSR
 * 3) subroutine first preserves return address in local variable using invokeStackBegin(variablePtr) macro
 * 4) subroutine then pulls all pushed parameters in opposite order using pull*() macros
 * 5) when subroutine is about to end, just before RTS is called, it must restore return address with invokeStackEnd(varPtr) macro
 *
 * Requires KickAssembler v4.x
 * (c) 2017-2018 Maciej Malecki
 */
#importonce
.filenamespace c64lib

/*
 * Preserves return address that is used with JSR.
 * Should be called at beginning of subroutine.
 *
 * Params:
 * placeholderPtr - pointer to the memory location (that is local variable of the subroutine)
 *                  where return address will be preserved.
 */
.macro invokeStackBegin(placeholderPtr) {
  pla
  sta placeholderPtr
  pla
  sta placeholderPtr + 1
}

/*
 * Restores return address that will be then used with RTS.
 * Should be called at the very end of subroutine just before RTS.
 *
 * Params:
 * placeholderPtr - pointer to the memory location (that is local variable of the subroutine)
 *                  from where return address will be restored.
 */
.macro invokeStackEnd(placeholderPtr) {
  lda placeholderPtr + 1
  pha
  lda placeholderPtr
  pha
}

/*
 * Pushes byte value as a parameter to the subroutine.
 * Such value should be then pulled in subroutine in opposite order.
 *
 * Params:
 * value - byte value of the parameter for subroutine
 */
.macro pushParamB(value) {
  lda #value
  pha
}

/*
 * Pushes two bytes value as a parameter to the subroutine.
 * Such value should be then pulled in subroutine in opposite order.
 *
 * Params:
 * value - word value of the parameter for subroutine
 */
.macro pushParamW(value) {
  pushParamB(<value)
  pushParamB(>value)
}

/*
 * Pushes byte pointed by an address as a parameter to the subroutine.
 * Such value should be then pulled in subroutine in opposite order.
 *
 * Params:
 * ptr - pointer to the byte value of the parameter for subroutine
 */
.macro pushParamBInd(ptr) {
  lda ptr
  pha
}

/*
 * Pushes two bytes value pointed by an address as a parameter to the subroutine.
 * Such value should be then pulled in subroutine in opposite order.
 *
 * Params:
 * ptr - pointer to the two bytes value of the parameter for subroutine
 */
.macro pushParamWInd(ptr) {
  pushParamBInd(ptr)
  pushParamBInd(ptr + 1)
}

/*
 * Pulls byte value from the stack and stores it under given address.
 *
 * Params:
 * placeholderPtr - pointer to the memory location where given byte will be pulled to
 */
.macro pullParamB(placeholderPtr) {
  pla
  sta placeholderPtr
}

/*
 * Pulls two bytes value from the stack and stores it under given address.
 *
 * Params:
 * placeholderPtr - pointer to the beginning of memory location where given two bytes will be pulled to
 */
.macro pullParamW(placeholderPtr) {
  pullParamB(placeholderPtr + 1)
  pullParamB(placeholderPtr)
}

/*
 * Pulls two bytes value from the stack and stores it under provided addresses.
 *
 * Params:
 *   placeholderPtrList - List of memory locations, where given two byte value will be stored
 */
.macro pullParamWList(placeholderPtrList) {
  .assert "list must be non empty", placeholderPtrList.size() > 0, true
  pla
  .for (var i = 0; i < placeholderPtrList.size(); i++) sta placeholderPtrList.get(i) + 1
  pla
  .for (var i = 0; i < placeholderPtrList.size(); i++) sta placeholderPtrList.get(i)
}
.assert "pullParamWList([$aaaa, $bbbb])", {pullParamWList(List().add($aaaa, $bbbb))},
{pla;sta $aaaa + 1; sta $bbbb + 1; pla; sta $aaaa; sta $bbbb}
