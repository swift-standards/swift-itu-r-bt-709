extension ITU_R_BT_709 {
    /// The span of code values a signal uses.
    public enum Range: Sendable, Hashable {
        /// Luma 16...235 and chroma 16...240 at eight bits, the range item 4.6 specifies.
        case narrow
        /// Every code value.
        case full
    }
}
