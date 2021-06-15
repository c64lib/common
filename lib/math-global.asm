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
