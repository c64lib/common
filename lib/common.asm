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
 * Increases argument by one preserving its type (addressing mode). To be used in pseudocommands.
 *
 * Params:
 * arg: mnemonic argument
 */
.function incArgument(arg) {
  .return CmdArgument(arg.getType(), arg.getValue() + 1)
}

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

/*
 * "Far" bmi branch. Depending on the jump length it either does bne or beq/jmp trick.
 */
.macro fbmi(label) {
  here: // we have to add 2 to "here", because relative jump is counted right after bne xx, and this instruction takes 2 bytes
    .if (here > label) {
      // jump back
      .if (here + 2 - label <= 128) {
        bmi label
       } else {
        bpl skip
        beq skip
          jmp label
        skip:
       }
    } else {
      // jump forward
      .if (label - here - 2 <= 127) {
        bmi label
      } else {
        bpl skip
        beq skip
          jmp label
        skip:
      }
    }
}

/*
 * Convert kbytes to bytes.
 */
.function toBytes(value) {
  .return value * 1024
}

.function convertHires(data) {
  .var result = ""
  .for(var i = 0; i < data.size(); i++) {
    .var ch = data.charAt(i)
    .if (ch == '.') {
      .eval result = result + '0'
    } else {
      .eval result = result + '1'
    }
  }
  .return result.asNumber(2)
}
.assert @"convertHires(\"........\") = 0", convertHires("........"), 0
.assert @"convertHires(\".......#\") = 1", convertHires(".......#"), 1
.assert @"convertHires(\"########\") = 255", convertHires("########"), 255

.function convertMultic(data) {
  .var result = ""
  .for(var i = 0; i < data.size(); i++) {
    .var ch = data.charAt(i)
    .if (ch == '.') .eval result = result + "00"
    .if (ch == '#') .eval result = result + "11"
    .if (ch == '+') .eval result = result + "01"
    .if (ch == 'o') .eval result = result + "10"
  }
  .return result.asNumber(2)
}
.assert @"convertMultic(\"....\") = 0", convertMultic("...."), 0
.assert @"convertMultic(\"...#\") = 3", convertMultic("...#"), 3
.assert @"convertMultic(\"####\") = 255", convertMultic("####"), 255

.macro ch(data) {
  .byte convertHires(data.substring(0, 8))
}

.macro cm(data) {
  .byte convertMultic(data.substring(0, 4))
}
