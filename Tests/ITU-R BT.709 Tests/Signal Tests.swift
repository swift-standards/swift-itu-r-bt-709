import ITU_R_BT_709
import Testing

@Suite struct `Signal Tests` {
    static func code(_ r: Double, _ g: Double, _ b: Double, depth: ITU_R_BT_709.Depth = .eight) -> ITU_R_BT_709.Code {
        ITU_R_BT_709.Signal(red: r, green: g, blue: b).quantised(depth: depth)
    }

    @Test func `white, black and the primaries take the code values of BT.709's luma and colour difference equations`() {
        #expect(Self.code(1, 1, 1) == ITU_R_BT_709.Code(luma: 235, blue: 128, red: 128))
        #expect(Self.code(0, 0, 0) == ITU_R_BT_709.Code(luma: 16, blue: 128, red: 128))
        #expect(Self.code(1, 0, 0) == ITU_R_BT_709.Code(luma: 63, blue: 102, red: 240))
        #expect(Self.code(0, 1, 0) == ITU_R_BT_709.Code(luma: 173, blue: 42, red: 26))
        #expect(Self.code(0, 0, 1) == ITU_R_BT_709.Code(luma: 32, blue: 240, red: 118))
    }

    @Test func `ten-bit limited range spans 64 to 940 for luma and 64 to 960 for chroma`() {
        #expect(Self.code(1, 1, 1, depth: .ten) == ITU_R_BT_709.Code(luma: 940, blue: 512, red: 512))
        #expect(Self.code(0, 0, 0, depth: .ten).luma == 64)
        #expect(Self.code(0, 0, 1, depth: .ten).blue == 960)
    }

    @Test func `full range uses every code value`() {
        #expect(ITU_R_BT_709.Signal(red: 1, green: 1, blue: 1).quantised(range: .full) == ITU_R_BT_709.Code(luma: 255, blue: 128, red: 128))
        #expect(ITU_R_BT_709.Signal(red: 0, green: 0, blue: 0).quantised(range: .full).luma == 0)
    }
}
