#import "64spec/lib/64spec.asm"
#import "../lib/math-global.asm"
#import "../lib/mem-global.asm"

sfspec: init_spec()
  describe("add16")

  it("0 + 0 = 0"); {
    c64lib_set16(0, operand)
    c64lib_set16(0, result)
    c64lib_set16(0, expected)
    c64lib_add16 operand : result
    assert_c_cleared
    assert_equal16 result : expected
  }

  it("1 + 0 = 1"); {
    c64lib_set16(1, operand)
    c64lib_set16(0, result)
    c64lib_set16(1, expected)
    c64lib_add16 operand : result
    assert_c_cleared
    assert_equal16 result : expected
  }

  it("255 + 1 = 256"); {
    c64lib_set16(255, operand)
    c64lib_set16(1, result)
    c64lib_set16(256, expected)
    c64lib_add16 operand : result
    assert_equal16 result : expected
  }

  it("1 + 255 = 256"); {
    c64lib_set16(1, operand)
    c64lib_set16(255, result)
    c64lib_set16(256, expected)
    c64lib_add16 operand : result
    assert_c_cleared
    assert_equal16 result : expected
  }

  it("256 + 0 = 256"); {
    c64lib_set16(256, operand)
    c64lib_set16(0, result)
    c64lib_set16(256, expected)
    c64lib_add16 operand : result
    assert_c_cleared
    assert_equal16 result : expected
  }

  it("0 + 256 = 256"); {
    c64lib_set16(0, operand)
    c64lib_set16(256, result)
    c64lib_set16(256, expected)
    c64lib_add16 operand : result
    assert_c_cleared
    assert_equal16 result : expected
  }

  it("65535 + 0 = 65535"); {
    c64lib_set16(65535, operand)
    c64lib_set16(0, result)
    c64lib_set16(65535, expected)
    c64lib_add16 operand : result
    assert_c_cleared
    assert_equal16 result : expected
  }

  it("0 + 65535 = 65535"); {
    c64lib_set16(0, operand)
    c64lib_set16(65535, result)
    c64lib_set16(65535, expected)
    c64lib_add16 operand : result
    assert_c_cleared
    assert_equal16 result : expected
  }

  it("1 + 65535 = 0"); {
    c64lib_set16(1, operand)
    c64lib_set16(65535, result)
    c64lib_set16(0, expected)
    c64lib_add16 operand : result
    assert_c_set
    assert_equal16 result : expected
  }

  it("65535 + 1 = 0"); {
    c64lib_set16(65535, operand)
    c64lib_set16(1, result)
    c64lib_set16(0, expected)
    c64lib_add16 operand : result
    assert_c_set
    assert_equal16 result : expected
  }
finish_spec()

* = * "Data"
result: .word 0
expected: .word 0
operand: .word 0

.print "result=$" + toHexString(result, 4)
.print "expected=$" + toHexString(expected, 4)
.print "operand=$" + toHexString(operand, 4)
