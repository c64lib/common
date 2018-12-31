#import "mem.asm"
#importonce
.filenamespace c64lib

.macro @copyFast(source, destination, count) { copyFast(source, destination, count) }
.macro @fillScreen(address, value) { fillScreen(address, value) }
.macro @set8(value, mem) { set8(value, mem) }
.macro @set16(value, mem) { set16(value, mem) }
.macro @copyWordIndirect(source, destinationPointer) { copyWordIndirect(source, destinationPointer) }
.macro @cmp16(value, low) { cmp16(value, low) } 
.macro @c64lib_rotateMemRightFast(startPtr, count) { rotateMemRightFast(startPtr, count) }
