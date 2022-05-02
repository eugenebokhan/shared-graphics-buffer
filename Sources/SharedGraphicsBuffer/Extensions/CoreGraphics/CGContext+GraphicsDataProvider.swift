import CoreGraphics

extension CGContext: GraphicsDataProvider {
    public func graphicsData() throws -> GraphicsData {
        guard let baseAddress = self.data
        else { throw GraphicsDataProviderError.missingData }
        return .init(
            width: UInt(self.width),
            height: UInt(self.height),
            baseAddress: baseAddress,
            bytesPerRow: UInt(self.bytesPerRow)
        )
    }
}
