# c64lib/common
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CircleCI](https://circleci.com/gh/c64lib/common/tree/master.svg?style=shield)](https://circleci.com/gh/c64lib/common/tree/master)
[![CircleCI](https://circleci.com/gh/c64lib/common/tree/develop.svg?style=shield)](https://circleci.com/gh/c64lib/common/tree/develop)
[![Gitter](https://badges.gitter.im/c64lib/community.svg)](https://gitter.im/c64lib/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

Check our [User's Manual](https://c64lib.github.io/user-manual/#_common) for more documentation on this library.

## Change log

### Changes in version 0.4.0

* New macro: `compress.asm\compressRLE`.
* New subroutine: `decompress_rle.asm`.

### Changes in version 0.3.0

* New macro: `math.asm/mulAndAdd` - multiple two numbers and add result to memory location.

### Changes in version 0.2.0

* Public elements of library are also declared as global symbols in "-global.asm" files using `c64lib_` name prefix.

* New macro: `common.asm/fbne` - far bne.
* New macro: `common.asm/fbmi` - far bmi.
* New macro: `common.asm/ch` - to define single line of hires character.
* New macro: `common.asm/cm` - to define single line of multicolor character.

* New pseudocommand: `math.asm/add16` - add two 16-bit values.
* New pseudocommand: `math.asm/sub16` - subtract two 16-bit values.
* New pseudocommand: `math.asm/asl16` - 16-bit asl operation.
* New pseudocommand: `math.asm/inc16` - increment 16-bit number.
* New pseudocommand: `math.asm/dec16` - decrement 16-bit number.

* New pseudocommand: `mem.asm/copy16` - copies 16-bit number.
* New pseudocommand: `mem.asm/copy8` - copies 8-bit number.
* New pseudocommand: `mem.asm/set8` - sets 8-bit number to given value.
