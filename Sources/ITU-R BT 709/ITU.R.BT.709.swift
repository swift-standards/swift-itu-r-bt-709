public import ITU
/// ITU-R BT.709: parameter values for the HDTV standards for production and international
/// programme exchange.
extension ITU.R.BT {
    public enum `709` {}
}

extension ITU.R.BT.`709` {
    /// Luma weight of red, item 3.2.
    public static let kr = 0.2126

    /// Luma weight of blue, item 3.2.
    public static let kb = 0.0722
}
