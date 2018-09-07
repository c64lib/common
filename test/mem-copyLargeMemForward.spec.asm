#import "64spec/lib/64spec.asm"
#import "../mem-global.asm"
#import "../invoke-global.asm"


sfspec: init_spec()

  describe("copyLargeMemForward")

  it("copies 7 bytes forward non overlapping"); {
    pushParamW(dataToBeMoved)
    pushParamW(targetLocation)
    pushParamW(7)
    jsr copyLargeMemForward
  
    assert_bytes_equal 7: targetLocation: dataToBeMoved
  }
  
  it("copies 260 bytes forward non overlapping"); {
    pushParamW(largeDataToBeMoved)
    pushParamW(largeTargetLocation)
    pushParamW(260)
    jsr copyLargeMemForward
    
    assert_bytes_equal 19: largeTargetLocation: largeDataToBeMoved
  }
  
finish_spec()

* = * "Data"
copyLargeMemForward: .namespace c64lib { _copyLargeMemForward() }
dataToBeMoved: .text "foo bar"
targetLocation: .text "       "

largeDataToBeMoved: .fill 260, 127.5 + sin(toRadians(i*360/256))
largeTargetLocation: .fill 260, 0
