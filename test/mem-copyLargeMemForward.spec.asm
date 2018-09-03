#import "64spec/lib/64spec.asm"
#import "../mem.asm"
#import "../invoke.asm"


sfspec: init_spec()

  describe("copyLargeMemForward")

  it("copies 7 bytes forward non overlapping"); {
    pushParamW(dataToBeMoved)
    pushParamW(targetLocation)
    pushParamW(7)
    jsr copyLargeMemForward
  
    assert_bytes_equal 7: targetLocation: dataToBeMoved
  }

finish_spec()

* = * "Data"
copyLargeMemForward: .namespace c64lib { _copyLargeMemForward() }
dataToBeMoved: .text "foo bar"
targetLocation: .text "       "
