#importonce
.filenamespace c64lib

/*
 * Adds 16 bit number "value" to given memory cell specified by "low" address.
 *
 * MOD: A, C
 */
.macro add16(value, dest) {
  clc
  lda dest
  adc #<value
  sta dest
  lda dest + 1
  adc #>value
  sta dest + 1
}
.assert "add16($0102, $A000) ", { add16($0102, $A000) }, {
  clc; lda $A000; adc #$02; sta $A000
  lda $A001; adc #$01; sta $A001
}
        
/*
 * Subtracts 16 bit number "value" from given memory cell specified by "low" address.
 *
 * MOD: A, C
 */
.macro sub16(value, low) {
  sec
  lda low
  sbc #<value
  sta low
  lda low + 1
  sbc #>value
  sta low + 1
}
.assert "sub16($0102, $A000)", { :sub16($0102, $A000) }, {
  sec; lda $A000; sbc #$02; sta $A000
  lda $A001; sbc #$01; sta $A001
}
.assert "sub16(256, $A000)", { sub16(256, $A000) }, {
  sec; lda $A000; sbc #0; sta $A000
  lda $A001; sbc #1; sta $A001
}
  
/*
 * Adds value from "source" memory location to value in "destination" memory location.
 *
 * MOD: A, C
 */
.macro addMem16(source, destination) {
  clc
  lda source
  adc destination
  sta destination
  lda source + 1
  adc destination + 1
  sta destination + 1
}
.assert "addMem16($A000, $B000)", { :addMem16($A000, $B000) }, {
  clc; lda $A000; adc $B000; sta $B000
  lda $A001; adc $B001; sta $B001
}
        
/*
 * Subtracts value from "source" memory location from value in "destination" memory location.
 *
 * MOD: A, C
 */
.macro subMem16(source, destination) {      
  sec
  lda destination
  sbc source
  sta destination
  lda destination + 1
  sbc source + 1
  sta destination + 1
}
.assert "subMem16($A000, $B000)", { :subMem16($A000, $B000) }, {
  sec; lda $B000; sbc $A000; sta $B000
  lda $B001; sbc $A001; sta $B001
}
        
/*
 * Shifts left 2 byte number specified with "low" address. Carry flag indicates last bit that has been "shifted out".
 * 
 * MOD: A, C
 */
.macro asl16(low) {
  clc
  asl low
  bcc !+
  lda low + 1
  asl
  ora #%1
  sta low + 1
!:
}

/*
 * Increments 16 bit number located in memory address starting from "destination".
 *
 * MOD: -
 */
.macro inc16(destination) {
  inc destination
  bne !+
  inc destination + 1
!:
}

/*
 * Decrements 16 bit number located in memory address starting from "destination".
 *
 * MOD: -
 */
.macro dec16(destination) {
  dec destination
  lda destination
  cmp #$ff
  bne !+
  dec destination + 1
!:
}
