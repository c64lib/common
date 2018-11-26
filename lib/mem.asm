#import "invoke.asm"
#import "math.asm"
#importonce
.filenamespace c64lib


/*
 * MOS 650X Vector table constants.
 */
.label NMI_LO       = $FFFA
.label NMI_HI       = $FFFB
.label RESET_LO     = $FFFC
.label RESET_HI     = $FFFD
.label IRQ_LO       = $FFFE
.label IRQ_HI       = $FFFF

/*
 * Copies "count" bytes from memory location starting in "source" to memory location starting from "destination".
 *
 * MOD: A
 */
.macro copyFast(source, destination, count) {
  .for(var i = 0; i < count; i++) {
    lda source + i
    sta destination + i
  }
}
.assert "copyFast($A000, $B000, 0) copies nothing", { :copyFast($A000, $B000, 0) }, {}
.assert "copyFast($A000, $B000, 1) copies one byte", { :copyFast($A000, $B000, 1) }, {
  lda $A000; sta $B000
}
.assert "copyFast($A000, $B000, 2) copies two bytes", { :copyFast($A000, $B000, 2) }, {
  lda $A000; sta $B000
  lda $A001; sta $B001
}

/*
 * Fills 1kb of memory (screen) starting from "address" with given "value".
 *
 * MOD: A, X
 */
.macro fillScreen(address, value) {
  lda #value
  ldx #$00
loop:
  sta address, x
  sta address + $0100, x
  sta address + $0200, x
  sta address + $0300, x
  inx
  bne loop
}

/*
 * Fills byte located in memory address "mem" with byte "value".
 *
 * MOD: A
 */
.macro set8(value, mem) {
  lda #value
  sta mem
}

/*
 * Fills word located in memory address "mem" with byte "value".
 *
 * MOD: A
 */
.macro set16(value, mem) {
  :set8(<value, mem)
  :set8(>value, mem + 1)
}
.assert "set16($1234, $A000) stores $34 under $A000 and $12 under $A001", { :set16($3412, $A000) }, {
  lda #$12
  sta $A000
  lda #$34
  sta $A001
}

.macro copyWordIndirect(source, destinationPointer) {
  ldy #0
  lda source
  sta (destinationPointer), y
  iny
  lda source + 1
  sta (destinationPointer), y
}

.macro cmp16(value, low) {
  lda #<value
  cmp low
  bne end
  lda #>value
  cmp low + 1
end:
}
              
// hosted subroutines

/*
 * Fills memory at given address with given value.
 * IN:
 *   A - value
 *   X - count
 *   Stack WORD - address
 * OUT:
 *   none
 * MOD: A, X
 */
.macro _fillMem() {
  sta value + 1                 // preserve A for later usage
  invokeStackBegin(returnPtr)
  pullParamW(address + 1)
  value: lda #$00
loop:
  dex
  address: sta $ffff, x
  bne loop
  invokeStackEnd(returnPtr)
  rts
  // local vars
  returnPtr: .word 0
}

/*
 * Fills given 1024 bytes of memory with given byte.
 * IN:
 *   A - value
 *   Stack WORD - address
 * OUT:
 *   none
 * MOD: A, X
 */
.macro _fillScreen() {
  sta value + 1
  invokeStackBegin(returnPtr)
  pullParamWList(List().add(sta0 + 1, sta1 + 1, sta2 + 1, sta3 + 1))
  add16($0100, sta1 + 1)
  add16($0200, sta2 + 1)
  add16($0300, sta3 + 1)
  value: lda #$00
  ldx #$00
loop:
  sta0: sta $ffff, x
  sta1: sta $ffff, x
  sta2: sta $ffff, x
  sta3: sta $ffff, x
  inx
  bne loop
  invokeStackEnd(returnPtr)
  rts
  // local vars
  returnPtr: .word 0
}

