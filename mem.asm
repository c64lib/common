#importonce
.filenamespace c64lib

.namespace common {

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
				
	.macro addMem16(source, destination) {
		clc
		lda source
		adc destination
		sta destination
		lda source + 1
		adc destination + 1
		sta destination + 1
	}
				
	.macro subMem16(source, destination) {			
		sec
		lda destination
		sbc source
		sta destination
		lda destination + 1
		sbc source + 1
		sta destination + 1
	}
				
				.macro @mul2Mem16(low) {
				clc			// 2
				asl low		// 5
				bcc !+		// 2
				lda low + 1	// 3
				asl			// 2
				ora #%1		// 2
				sta low + 1	// 3
				!:				// =19
				}
				
	.macro copy8(source, destimation) {
		lda source
		sta destination
	}
	
	.macro copy16(source, destination) {
		:copy8(source, destination)
		:copy8(source+1, destination+1)
	}
				
				.macro @copyWordIndirect(source, destinationPointer) {
				ldy #0
				lda source
				sta (destinationPointer), y
				iny
				lda source + 1
				sta (destinationPointer), y
				}
				
				.macro @incWord(destination) {
				inc destination
				bne !+
				inc destination + 1
				!:
				}
				
				.macro @set8(value, mem) {
				lda #value
				sta mem
				}
				
				.macro @zero8(mem) {
				:set8(0, mem)
				}
				
				.macro @set16(value, mem) {
				lda #<value
				sta mem
				lda #>value
				sta mem + 1
				}
				
				.macro @zero16(mem) {
				:set16($0000, mem)
				}
}
