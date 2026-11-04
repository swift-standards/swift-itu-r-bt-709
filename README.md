# swift-itu-r-bt-709

Use this package when you need the HDTV colour parameters of ITU-R BT.709: the primaries and D65 white point, the luma weights, or the Y′CbCr code values of an R′G′B′ colour. Start from `ITU_R_BT_709.Signal` to turn R′G′B′ into Y′CbCr, and from `ITU_R_BT_709.Chromaticity` for the primaries and white point.

## Laws

- `ITU_R_BT_709.Signal` takes R′G′B′ that is already gamma encoded. The package applies no transfer function.
- Luma is `ITU_R_BT_709.kr` times red, plus `ITU_R_BT_709.kb` times blue, plus the remaining weight times green. Cb and Cr are the blue and red differences from luma, scaled so each spans -0.5 to 0.5.
- At narrow range, 8-bit luma spans 16 to 235 and chroma spans 16 to 240, with 128 as zero chroma. At 10 bits every value is multiplied by 4, so luma spans 64 to 940 and chroma 64 to 960.
- At full range, luma spans every code value, from 0 to 255 at 8 bits. Zero chroma sits at the midpoint, 128 at 8 bits.
- Code values are rounded to the nearest integer. White, black and the three primaries give the code values BT.709 lists, such as 63, 102, 240 for pure red at 8 bits.
