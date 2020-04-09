#import "64spec/lib/64spec.asm"
#import "../lib/invoke-global.asm"


sfspec: init_spec()

  describe("copyLargeMemForward")

  it("copies 7 bytes forward non overlapping"); {
    c64lib_pushParamW(dataToBeMoved)
    c64lib_pushParamW(targetLocation)
    c64lib_pushParamW(7)
    jsr copyLargeMemForward

    assert_bytes_equal 7: targetLocation: dataToBeMoved
  }

  it("copies 260 bytes forward non overlapping"); {
    c64lib_pushParamW(largeDataToBeMoved)
    c64lib_pushParamW(largeTargetLocation)
    c64lib_pushParamW(260)
    jsr copyLargeMemForward

    assert_bytes_equal 19: largeTargetLocation: largeDataToBeMoved
  }

finish_spec()

* = * "Data"
copyLargeMemForward:
                #import "../lib/sub/copy-large-mem-forward.asm"
dataToBeMoved: .text "foo bar"
targetLocation: .text "       "

largeDataToBeMoved: .fill 260, 127.5 + sin(toRadians(i*360/256))
largeTargetLocation: .fill 260, 0
