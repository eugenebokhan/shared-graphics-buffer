import MetalTools

public extension MTLTexture {
    func graphicsData() throws -> GraphicsData {
        guard let buffer = self.buffer
        else { throw GraphicsDataProviderError.missingData }
        
        return .init(
            width: UInt(self.width),
            height: UInt(self.height),
            baseAddress: buffer.contents(),
            bytesPerRow: UInt(self.bufferBytesPerRow)
        )
    }
    
    func vImageBuffer() throws -> vImage_Buffer {
        return try self.graphicsData().vImageBuffer()
    }
    
    func cvPixelBuffer(cvPixelFormat: CVPixelFormat) throws -> CVPixelBuffer {
        return try self.graphicsData().cvPixelBuffer(cvPixelFormat: cvPixelFormat)
    }
    
    @available(iOS 14.0, macCatalyst 14.0, *)
    func mlMultiArray(
        shape: [Int],
        dataType: MLMultiArrayDataType
    ) throws -> MLMultiArray {
        return try self.graphicsData().mlMultiArray(
            shape: shape,
            dataType: dataType
        )
    }
    
    @available(iOS 14.0, macCatalyst 14.0, *)
    func mlMultiArray(
        shape: [Int],
        strides: [Int],
        dataType: MLMultiArrayDataType
    ) throws -> MLMultiArray {
        return try self.graphicsData().mlMultiArray(
            shape: shape,
            strides: strides,
            dataType: dataType
        )
    }

}
