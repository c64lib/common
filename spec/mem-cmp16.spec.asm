#import "64spec/lib/64spec.asm"
#import "../lib/mem-global.asm"

sfspec: init_spec()

  describe("cmp16")

  it("of 256 and 256 gives true"); {
    c64lib_cmp16(256, _256)
    assert_z_set
  }

  it("of 0 and 256 gives false"); {
    c64lib_cmp16(0, _256)
    assert_z_cleared
  }

  it("of 7 and 7 gives true"); {
    c64lib_cmp16(7, _7)
    assert_z_set
  }

  it("of 0 and 0 gives true"); {
    c64lib_cmp16(0, _0)
    assert_z_set
  }

finish_spec()

* = * "Data"
_256: .word 256
_7: .word 7
_0: .word 0
