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
