extension ITU_R_BT_709 {
    /// Digital Y′, Cb and Cr code values.
    public struct Code: Sendable, Hashable {
        public let luma: UInt16
        public let blue: UInt16
        public let red: UInt16

        public init(luma: UInt16, blue: UInt16, red: UInt16) {
            self.luma = luma
            self.blue = blue
            self.red = red
        }
    }
}
