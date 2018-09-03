#import "64spec/lib/64spec.asm"
#import "../mem.asm"
#import "../invoke.asm"


sfspec: init_spec()

  .namespace c64lib { cmp16(256, counter) }
  assert_z_set
  
  .namespace c64lib { cmp16(0, counter) }
  assert_z_cleared
  
  .namespace c64lib { cmp16(7, counter2) }
  assert_z_set
  
  .namespace c64lib { cmp16(0, counter3) }
  assert_z_set
  
  pushParamW(dataToBeMoved)
  pushParamW(targetLocation)
  pushParamW(7)
  jsr copyLargeMemForward
  
  assert_bytes_equal 1: targetLocation: dataToBeMoved

finish_spec()

* = * "Data"
copyLargeMemForward: .namespace c64lib { _copyLargeMemForward() }
counter: .word 256
counter2: .word 7
counter3: .word 0
dataToBeMoved: .text "foo bar"
targetLocation: .text "       "
