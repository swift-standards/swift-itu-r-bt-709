extension ITU_R_BT_709 {
    /// The analogue Y′CbCr signal, items 3.2 to 3.3: E′Y in 0...1, E′CB and E′CR in −0.5...0.5.
    public struct Signal: Sendable, Hashable {
        public let luma: Double
        public let blue: Double
        public let red: Double

        /// The signal of nonlinear R′G′B′, each in 0...1.
        public init(red r: Double, green g: Double, blue b: Double) {
            let kr = ITU_R_BT_709.kr
            let kb = ITU_R_BT_709.kb
            let y = kr * r + (1 - kr - kb) * g + kb * b
            self.luma = y
            self.blue = (b - y) / (2 * (1 - kb))
            self.red = (r - y) / (2 * (1 - kr))
        }
    }
}

extension ITU_R_BT_709.Signal {
    /// The digital code values, items 4.6 and 4.7.
    ///
    /// At narrow range luma spans 16...235 and chroma 16...240, times 4 at ten bits, as BT.709
    /// specifies. Full range spans the whole code space.
    public func quantised(depth: ITU_R_BT_709.Depth = .eight, range: ITU_R_BT_709.Range = .narrow) -> ITU_R_BT_709.Code {
        let bits = depth == .eight ? 8 : 10
        let scale = Double(1 << (bits - 8))
        let top = Double((1 << bits) - 1)
        func code(_ value: Double) -> UInt16 { UInt16(max(0, min(top, value.rounded()))) }
        if range == .full {
            return ITU_R_BT_709.Code(
                luma: code(top * luma),
                blue: code(top * blue + Double(1 << (bits - 1))),
                red: code(top * red + Double(1 << (bits - 1)))
            )
        }
        return ITU_R_BT_709.Code(
            luma: code((219 * luma + 16) * scale),
            blue: code((224 * blue + 128) * scale),
            red: code((224 * red + 128) * scale)
        )
    }
}
