#import "64spec/lib/64spec.asm"
#import "../lib/math-global.asm"

sfspec: init_spec()
  describe("dec16")

  it("of 0 gives 65535"); {
    c64lib_dec16(dec16ZeroActual)
    assert_equal16 dec16ZeroActual: dec16ZeroExpected
  }

  it("of 5 gives 4"); {
    c64lib_dec16(dec16Actual)
    assert_equal16 dec16Actual: dec16Expected
  }

  it("of 256 gives 255"); {
    c64lib_dec16(dec16WordActual)
    assert_equal16 dec16WordActual: dec16WordActual
  }

finish_spec()

* = * "Data"
dec16Actual: .word 5
dec16Expected: .word 4
dec16WordActual: .word 256
dec16WordExpected: .word 255
dec16ZeroActual: .word 0
dec16ZeroExpected: .word $ffff