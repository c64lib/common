#import "mem.asm"
#importonce
.filenamespace c64lib

.macro @invokeStackBegin(placeholderPtr) { invokeStackBegin(placeholderPtr) }
.macro @invokeStackEnd(placeholderPtr) { invokeStackEnd(placeholderPtr) }
.macro @pushParamB(value) { pushParamB(value) }
.macro @pushParamW(value) { pushParamW(value) }
.macro @pushParamBInd(ptr) { pushParamBInd(ptr) }
.macro @pushParamWInd(ptr) { pushParamWInd(ptr) }
.macro @pullParamB(placeholderPtr) { pullParamB(placeholderPtr) }
.macro @pullParamW(placeholderPtr) { pullParamW(placeholderPtr) }
.macro @pullParamWList(placeholderPtrList) { pullParamWList(placeholderPtrList) }
