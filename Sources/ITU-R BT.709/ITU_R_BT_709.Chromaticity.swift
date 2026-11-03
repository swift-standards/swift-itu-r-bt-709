extension ITU_R_BT_709 {
    /// A CIE 1931 chromaticity.
    public struct Chromaticity: Sendable, Hashable {
        public let x: Double
        public let y: Double

        public init(x: Double, y: Double) {
            self.x = x
            self.y = y
        }
    }
}

extension ITU_R_BT_709.Chromaticity {
    /// Primaries and reference white, items 1.2 to 1.4.
    public static let red = Self(x: 0.640, y: 0.330)
    public static let green = Self(x: 0.300, y: 0.600)
    public static let blue = Self(x: 0.150, y: 0.060)
    /// CIE illuminant D65.
    public static let white = Self(x: 0.3127, y: 0.3290)
}
