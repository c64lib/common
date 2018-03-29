#importonce
.filenamespace c64lib

/*
 * Adds 16 bit number "value" to given memory cell specified by "low" address.
 *
 * MOD: A, C
 */
.macro add16(value, low) {
	clc
	lda low
	adc #<value
	sta low
	lda low + 1
	adc #>value
	sta low + 1
}
.assert "add16($0102, $A000)", { :add16($0102, $A000) }, {
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
	sbc	#<value
	sta low
	lda low + 1
	sbc #>value
	sta low + 1
}
.assert "sub16($0102, $A000)", { :sub16($0102, $A000) }, {
	sec; lda $A000; sbc #$02; sta $A000
	lda $A001; sbc #$01; sta $A001
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
							
