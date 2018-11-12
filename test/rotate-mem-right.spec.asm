#import "64spec/lib/64spec.asm"
#import "../invoke-global.asm"


sfspec: init_spec()

  describe("rotate-mem-right")

  it("rotates 7 bytes of data"); {
    pushParamW(dataToBeRotated)
    ldx #7
    jsr rotateMemRight
  
    assert_bytes_equal 7: dataToBeRotated: dataToBeCompared
  }
    
finish_spec()

* = * "Data"
rotateMemRight: 
                #import "../sub/rotate-mem-right.asm"
dataToBeRotated: .text "foo bar"
dataToBeCompared: .text "rfoo ba"
