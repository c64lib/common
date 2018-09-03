#import "64spec/lib/64spec.asm"
#import "../mem.asm"

sfspec: init_spec()

  describe("cmp16")

  .namespace c64lib { cmp16(256, counter) }
  assert_z_set
  
  .namespace c64lib { cmp16(0, counter) }
  assert_z_cleared
  
  .namespace c64lib { cmp16(7, counter2) }
  assert_z_set
  
  .namespace c64lib { cmp16(0, counter3) }
  assert_z_set

finish_spec()

* = * "Data"
counter: .word 256
counter2: .word 7
counter3: .word 0
