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
.macro @invokeStackBegin(placeholderPtr) {
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
.macro @invokeStackEnd(placeholderPtr) {
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
.macro @pushByteParamV(value) {
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
.macro @pushWordParamV(value) {
  pushByteParamV(<value)
  pushByteParamV(>value)
}

/*
 * Pushes pointer to the byte value as a parameter to the subroutine. 
 * Such value should be then pulled in subroutine in opposite order.
 *
 * Params:
 * ptr - pointer to the byte value of the parameter for subroutine
 */
.macro @pushByteParamPtr(ptr) {
  lda ptr
  pha
}

/*
 * Pushes pointer to the two bytes value as a parameter to the subroutine. 
 * Such value should be then pulled in subroutine in opposite order.
 *
 * Params:
 * ptr - pointer to the two bytes value of the parameter for subroutine
 */
.macro @pushWordParamPtr(ptr) {
  pushByteParamPtr(ptr)
  pushByteParamPtr(ptr + 1)
}

/*
 * Pulls byte value from the stack and stores it under given address. 
 *
 * Params:
 * placeholderPtr - pointer to the memory location where given byte will be pulled to
 */
.macro @pullByteParam(placeholderPtr) {
  pla
  sta placeholderPtr
}

/*
 * Pulls two bytes value from the stack and stores it under given address. 
 *
 * Params:
 * placeholderPtr - pointer to the beginning of memory location where given two bytes will be pulled to
 */
.macro @pullWordParam(placeholderPtr) {
  pullByteParam(placeholderPtr + 1)
  pullByteParam(placeholderPtr)
}
