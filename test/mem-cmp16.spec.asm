#import "64spec/lib/64spec.asm"
#import "../mem-global.asm"

sfspec: init_spec()

  describe("cmp16")

  it("of 256 and 256 gives true"); {
    cmp16(256, _256)
    assert_z_set
  }
  
  it("of 0 and 256 gives false"); {
    cmp16(0, _256)
    assert_z_cleared
  }
  
  it("of 7 and 7 gives true"); {
    cmp16(7, _7)
    assert_z_set
  }
  
  it("of 0 and 0 gives true"); {
    cmp16(0, _0)
    assert_z_set
  }

finish_spec()

* = * "Data"
_256: .word 256
_7: .word 7
_0: .word 0
