import Foundation

public protocol MultiplanarPlanarGraphicsDataProvider {
    func graphicsData(of planeIndex: Int) throws -> GraphicsData
}

public extension MultiplanarPlanarGraphicsDataProvider {
    func vImageBuffer(planeIndex: Int) throws -> vImage_Buffer {
        return try self.graphicsData(of: planeIndex).vImageBuffer()
    }
    
    func cvPixelBuffer(
        planeIndex: Int,
        cvPixelFormat: CVPixelFormat
    ) throws -> CVPixelBuffer {
        return try self.graphicsData(of: planeIndex).cvPixelBuffer(cvPixelFormat: cvPixelFormat)
    }
    
    @available(iOS 14.0, macCatalyst 14.0, *)
    func mlMultiArray(
        planeIndex: Int,
        shape: [Int],
        dataType: MLMultiArrayDataType
    ) throws -> MLMultiArray {
        return try self.graphicsData(of: planeIndex).mlMultiArray(
            shape: shape,
            dataType: dataType
        )
    }
    
    @available(iOS 14.0, macCatalyst 14.0, *)
    func mlMultiArray(
        planeIndex: Int,
        shape: [Int],
        strides: [Int],
        dataType: MLMultiArrayDataType
    ) throws -> MLMultiArray {
        return try self.graphicsData(of: planeIndex).mlMultiArray(
            shape: shape,
            strides: strides,
            dataType: dataType
        )
    }
    
    func mtlBuffer(
        planeIndex: Int,
        device: MTLDevice
    ) throws -> MTLBuffer {
        return try self.graphicsData(of: planeIndex).mtlBuffer(device: device)
    }
    
    func mtlTexture(
        planeIndex: Int,
        device: MTLDevice,
        pixelFormat: MTLPixelFormat,
        usage: MTLTextureUsage = []
    ) throws -> MTLTexture {
        return try self.graphicsData(of: planeIndex).mtlTexture(
            device: device,
            pixelFormat: pixelFormat,
            usage: usage
        )
    }
}
