#import "64spec/lib/64spec.asm"
#import "../mem.asm"
#import "../invoke.asm"


sfspec: init_spec()

  describe("copyLargeMemForward")

  pushParamW(dataToBeMoved)
  pushParamW(targetLocation)
  pushParamW(7)
  jsr copyLargeMemForward
  
  assert_bytes_equal 1: targetLocation: dataToBeMoved

finish_spec()

* = * "Data"
copyLargeMemForward: .namespace c64lib { _copyLargeMemForward() }
dataToBeMoved: .text "foo bar"
targetLocation: .text "       "
