#import "math.asm"
#importonce
.filenamespace c64lib

.macro @add16(value, low) { add16(value, low) }
.macro @sub16(value, low) { sub16(value, low) }
.macro @addMem16(source, destination) { addMem16(source, destination ) }
.macro @asl16(low) { asl16(low) }
.macro @inc16(destination) { inc16(destination) }
.macro @dec16(destination) { dec16(destination) }
