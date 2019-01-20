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

/*
 * "Far" bne branch. Depending on the jump length it either does bne or beq/jmp trick.
 */
.macro fbne(label) {
  here: // we have to add 2 to "here", because relative jump is counted right after bne xx, and this instruction takes 2 bytes
    .if (here > label) {
      // jump back
      .if (here + 2 - label <= 128) {
        bne label
       } else {
        beq skip
          jmp label
        skip:
       }
    } else {
      // jump forward
      .if (label - here - 2 <= 127) {
        bne label
      } else {
        beq skip
          jmp label
        skip:
      }
    }
}
