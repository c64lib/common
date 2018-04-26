#importonce
.filenamespace c64lib

/*
 * Why Kickassembler does not support bitwise negation on numerical values?
 * 
 * Params:
 * value: byte to be negated
 */
.function neg(value) {
  .return value ^ $FF
}
.assert "neg($00) gives $FF", neg($00), $FF
.assert "neg($FF) gives $00", neg($FF), $00
.assert "neg(%10101010) gives %01010101", neg(%10101010), %01010101
