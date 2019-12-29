#import "mem.asm"
#importonce
.filenamespace c64lib

.macro @c64lib_copyFast(source, destination, count) { copyFast(source, destination, count) }
.macro @c64lib_fillScreen(address, value) { fillScreen(address, value) }
.macro @c64lib_set8(value, mem) { set8(value, mem) }
.pseudocommand @c64lib_set8 value : mem { set8 value : mem }
.macro @c64lib_set16(value, mem) { set16(value, mem) }
.macro @c64lib_copyWordIndirect(source, destinationPointer) { copyWordIndirect(source, destinationPointer) }
.macro @c64lib_cmp16(value, low) { cmp16(value, low) } 
.macro @c64lib_rotateMemRightFast(startPtr, count) { rotateMemRightFast(startPtr, count) }
